//
//  DetailInteractor.swift
//  foodRecipesSearcher
//
//  Created by Boris Sortino on 17/05/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//
import Foundation

final class DetailInteractorImplementation {
    private var output: DetailPresenter?
    init(output: DetailPresenter) {
        self.output = output
        collectionId = ""
    }
    // MARK: - Data store
    var collectionId: String
    // MARK: - Internal properties
    private var retrivedData: [ITunesResponseDataModel] = [] {
        didSet {
            output?.presentData()
        }
    }
}
extension DetailInteractorImplementation: DetailInteractor {
    func viewDidLoad() {
        retrieveData()
    }
}
extension DetailInteractorImplementation: DetailDataStore {}
private extension DetailInteractorImplementation {
    func retrieveData() {
        guard let endpoint = Endpoints.detail(collectionId).value else {
            return
        }
        URLSession.shared.retrieveData(with: endpoint) { [weak self] (response: ITunesResponseContainer?, error) in
            guard let response = response else {
                #if DEBUG
                print(error ?? "Unknown error while unwrapping response.")
                #endif
                return
            }
            self?.retrivedData = response.results
        }
    }
}
