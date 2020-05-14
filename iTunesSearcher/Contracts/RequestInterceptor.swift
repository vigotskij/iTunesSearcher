//
//  RequestInterceptor.swift
//  iTunesSearcher
//
//  Created by Boris Sortino on 13/05/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//
import Foundation
protocol RequestInterceptor {
    func intercept(request: URLRequest, completionHandler: @escaping (URLRequest) -> Void )
}
