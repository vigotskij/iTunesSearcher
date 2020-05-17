//
//  Constants.swift
//  iTunesSearcher
//
//  Created by Boris Sortino on 14/05/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//
import Foundation
enum Endpoints{
    case main
    case detail(String)

    var value: URL? {
        switch self {
        case .main:
            return URL(string: "https://itunes.apple.com/search")
        case .detail(let id):
            return URL(string: "https://itunes.apple.com/lookup?id=\(id)&entity=song")
        }
    }
}
