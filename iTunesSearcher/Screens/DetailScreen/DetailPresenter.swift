//
//  DetailPresenter.swift
//  foodRecipesSearcher
//
//  Created by Boris Sortino on 17/05/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

final class DetailPresenterImplementation {
    private var output: DetailView?
    
    init(output: DetailView) {
        self.output = output
    }
}
extension DetailPresenterImplementation: DetailPresenter {
    func presentData() {
        output?.updateView()
    }
}
