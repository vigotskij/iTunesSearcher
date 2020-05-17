//
//  RequestInterceptor.swift
//  iTunesSearcher
//
//  Created by Boris Sortino on 13/05/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//
import Foundation
protocol RequestInterceptor {
    func intercept(request: URL, completionHandler: @escaping (URLRequest?) -> Void )
}
