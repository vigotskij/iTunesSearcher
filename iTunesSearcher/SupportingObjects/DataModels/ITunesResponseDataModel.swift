//
//  ITunesResponseDataModel.swift
//  iTunesSearcher
//
//  Created by Boris Sortino on 16/05/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//
import Foundation
struct ITunesResponseContainer: Decodable {
    let results: [ITunesResponseDataModel]
}
struct ITunesResponseDataModel: Decodable {
    let wrapperType: WrappedType
    let kind: Kind?
    let collectionId: Int?
    var collectionIdString: String? {
        guard let collectionId = collectionId else {
            return nil
        }
        return String(describing: collectionId)
    }
    let artworkUrl100: String?
    let artistName: String?
    let collectionName: String
    let trackName: String?
    let trackCensoredName: String?
    let collectionCensoredName: String?
    let trackCount: Int?
    let trackNumber: Int?

    static func < (lhs: ITunesResponseDataModel, rhs: ITunesResponseDataModel) -> Bool {
        guard
            let lhsNumber = lhs.trackNumber,
            let rhsNumber = rhs.trackNumber else {
                return false
        }
        return lhsNumber < rhsNumber
    }
}
extension ITunesResponseDataModel {
    enum WrappedType: String, Decodable {
        case track
        case collection
        case artist

        case unknown

        init(from decoder: Decoder) throws {
            self = try WrappedType(rawValue:
                decoder
                .singleValueContainer()
                .decode(RawValue.self))
                ?? .unknown
        }
    }
    enum Kind: String, Decodable {
        case song
        case album

        case unknown

        enum CodingKeys: String, CodingKey {
            case song
            case album = "Album"
        }

        init(from decoder: Decoder) throws {
            self = try Kind(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
        }
    }
}
