//
//  PaginationInterceptorTests.swift
//  iTunesSearcherTests
//
//  Created by Boris Sortino on 17/05/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

import XCTest
@testable import iTunesSearcher

class PaginationInterceptorTests: XCTestCase {
    var sut: RequestInterceptor = PaginationRequestInterceptor()
    var baseURL = URL(string: "https//www.google.com/")

    override func tearDown() {
        sut = PaginationRequestInterceptor()
    }

    func testPaginationFirstUsage() {
        guard let baseURL = baseURL else {
            XCTFail("Couldn't unwrap baseURL")
            return
        }
        sut.intercept(request: baseURL) { request in
            guard let interceptedRequest = request,
                let url = interceptedRequest.url else {
                XCTFail("Couldn't unwrap interceptedRequest")
                return
            }
            let queryItems = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems ?? []
            for item in queryItems {
                if item.name == PaginationConstants.paginationKey {
                    XCTAssertTrue(item.value ?? "" == "\(PaginationConstants.paginationDefault)")
                } else if item.name == PaginationConstants.offsetKey {
                    XCTAssertTrue(item.value ?? "" == "\(PaginationConstants.offsetDefault)")
                } else {
                    XCTFail("Unexpected query item: [\(item.name): \(String(describing: item.value))")
                }
            }
        }
    }
    func testOffsetIncrement() {
        guard let baseURL = baseURL else {
            XCTFail("Couldn't unwrap baseURL")
            return
        }
        sut.intercept(request: baseURL) { [weak self] request in
            guard
                let interceptedRequest = request,
                let url = interceptedRequest.url else {
                XCTFail("Couldn't unwrap interceptedRequest or url")
                return
            }
            self?.sut.intercept(request: url) { incrementedRequest in
                guard
                    let interceptedIncrementedRequest = incrementedRequest,
                    let incrementedURL = interceptedIncrementedRequest.url else {
                    XCTFail("Coudn't unwrap incremented request or url")
                    return
                }
                let result = URLComponents(url: incrementedURL, resolvingAgainstBaseURL: false)?
                    .queryItems?
                    .first{ $0.name == PaginationConstants.offsetKey }
                let expectedResult =
                "\(PaginationConstants.offsetDefault + PaginationConstants.paginationDefault)"
                XCTAssertEqual(result?.value ?? "", expectedResult)
            }
        }
    }
}
