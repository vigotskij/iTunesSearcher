//
//  PaginationInterceptor.swift
//  iTunesSearcher
//
//  Created by Boris Sortino on 17/05/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

import Foundation
final class PaginationRequestInterceptor: RequestInterceptor {
    private var pagination = PaginationConstants.paginationDefault
    private var offset = PaginationConstants.offsetDefault

    func intercept(request: URL, completionHandler: @escaping (URLRequest?) -> Void) {
        var components = URLComponents(url: request, resolvingAgainstBaseURL: false)
        components?.queryItems = getQueryElements()
        offset += pagination
        guard let interceptedRequest = components?.url else {
            completionHandler(nil)
            return
        }
        completionHandler(URLRequest(url: interceptedRequest))
    }
}
private extension PaginationRequestInterceptor {
    func getQueryElements() -> [URLQueryItem] {
        return [
            URLQueryItem(name: PaginationConstants.paginationKey, value: "\(pagination)"),
            URLQueryItem(name: PaginationConstants.offsetKey, value: "\(offset)")
        ]
    }
}
