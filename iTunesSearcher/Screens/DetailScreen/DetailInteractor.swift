//
//  DetailInteractor.swift
//  foodRecipesSearcher
//
//  Created by Boris Sortino on 17/05/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//
final class DetailInteractorImplementation {
    private var output: DetailPresenter?
    init(output: DetailPresenter) {
        self.output = output
        collectionId = ""
    }
    // MARK: Data store
    var collectionId: String
}
extension DetailInteractorImplementation: DetailInteractor {
    func viewDidLoad() {
        
    }
}
extension DetailInteractorImplementation: DetailDataStore {}
