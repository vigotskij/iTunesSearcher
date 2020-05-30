//
//  Endpoints.swift
//  iTunesSearcher
//
//  Created by Boris Sortino on 30/05/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

import Foundation
enum Endpoints {
    case main(String)
    case detail(String)

    var value: URL? {
        switch self {
        case .main(let querySearch):
            guard let url = URL(string: "https://itunes.apple.com/search") else {
                return nil
            }
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
            components?.queryItems = [
                URLQueryItem(name: SearchQueriesConstants.searchQueryKey,
                             value: querySearch),
                URLQueryItem(name: SearchQueriesConstants.searchKindQueryKey,
                             value: SearchQueriesConstants.searchKindQueryValue)
            ]
            return components?.url
        case .detail(let id):
            return URL(string: "https://itunes.apple.com/lookup?id=\(id)&entity=song")
        }
    }
}
