//
//  DetailModels.swift
//  iTunesSearcher
//
//  Created by Boris Sortino on 13/05/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//
import UIKit
enum DetailModels {
    // MARK: - Raw data for Interactor
    struct Response {
        var rawData: [ITunesResponseDataModel]
    }
    // MARK: - Interactor processed data for Presenter
    struct DataModel {
        let coverImageUrl: URL?
        let albumTitle: String?
        let filteredData: [SongsDataModel]

        struct SongsDataModel {
            let trackNumber: Int?
            let trackName: String?
        }

        init(from response: Response) {
            let coverImageString = response.rawData.first?.artworkUrl100 ?? ""
            albumTitle = response.rawData.first?.collectionName
            coverImageUrl = URL(string: coverImageString)
            filteredData = response.rawData.map { SongsDataModel(trackNumber: $0.trackNumber,
                                                                 trackName: $0.trackName)}
        }
    }
    // MARK: - Modeled data for pasive view
    struct ViewModel {
        let coverImage: UIImage?
        let title: String
        let songsList: [SongsViewModel]

        struct SongsViewModel {
            let name: String
        }
    }
}
