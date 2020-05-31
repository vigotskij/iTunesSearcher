//
//  DetailConfigurator.swift
//  foodRecipesSearcher
//
//  Created by Boris Sortino on 17/05/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

final class DetailConfiguratorImplementation: DetailConfigurator {
    func configure(with viewController: DetailViewController) {
        let presenter: DetailPresenter = DetailPresenterImplementation(output: viewController)
        let interactor: (DetailInteractor & DetailDataStore) = DetailInteractorImplementation(output: presenter)
        let router: DetailRouter = DetailRouterImplementation(viewController: viewController)
        viewController.output = interactor
        viewController.dataStore = interactor
        viewController.router = router
    }
}
