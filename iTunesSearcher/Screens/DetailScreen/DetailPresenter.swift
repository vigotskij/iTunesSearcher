//
//  DetailPresenter.swift
//  foodRecipesSearcher
//
//  Created by Boris Sortino on 17/05/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//
import UIKit
final class DetailPresenterImplementation {
    private var output: DetailView?

    init(output: DetailView) {
        self.output = output
    }
}
extension DetailPresenterImplementation: DetailPresenter {
    func presentData(with processedData: DetailModels.DataModel) {
        guard let url = processedData.coverImageUrl,
            let data = try? Data(contentsOf: url),
            let image = UIImage(data: data) else {
                return
        }
        let songs = processedData.filteredData
            .sorted(by: <)
            .map { DetailModels.ViewModel.SongsViewModel(name: $0.trackName ?? "")}
        let viewModel = DetailModels.ViewModel(coverImage: image,
                                               title: processedData.albumTitle ?? "",
                                               songsList: songs)
        output?.updateView(with: viewModel)
    }
}
