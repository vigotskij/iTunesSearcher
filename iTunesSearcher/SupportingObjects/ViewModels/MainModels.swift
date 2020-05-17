//
//  MainModels.swift
//  iTunesSearcher
//
//  Created by Boris Sortino on 13/05/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

enum MainModels {
    // MARK: - Raw data for Interactor
    struct Response {
        var rawData: [ITunesResponseDataModel]
    }
    // MARK: - Interactor processed data for Presenter
    struct DataModel {
        var processedData: [FilteredData]

        init(from response: MainModels.Response) {
            processedData = response.rawData.map {FilteredData(title: $0.trackName ?? "",
                                                               artist: $0.artistName ?? "")}
        }
    }
    // MARK: - Modeled data for pasive view
    struct ViewModel {
        var cellsViewModel: [CellViewModel]

        init(from dataModel: MainModels.DataModel) {
            cellsViewModel = dataModel.processedData.map { CellViewModel(title: $0.title,
                                                                         artist: $0.artist)}
        }
    }
}
// MARK: - Inner models
extension MainModels {
    struct FilteredData {
        var title: String
        var artist: String
    }
    struct CellViewModel {
        var title: String
        var artist: String
    }
}
