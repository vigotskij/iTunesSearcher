//
//  MainConfiguratorImplementation.swift
//  iTunesSearcher
//
//  Created by Boris Sortino on 10/05/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

final class MainConfiguratorImplementation: MainConfigurator {
    func configure(with viewController: MainViewController) {
        let presenter: MainPresenter = MainPresenterImplementation(output: viewController)
        let interactor: MainInteractor = MainInteractorImplementation(output: presenter)
        let router: MainRouter = MainRouterImplementation(viewController: viewController)
        viewController.router = router
        viewController.output = interactor
    }
}
