//
//  MainRouterImplementation.swift
//  iTunesSearcher
//
//  Created by Boris Sortino on 10/05/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//
final class MainRouterImplementation: MainRouter {
    private var viewController: MainViewController

    init(viewController: MainViewController) {
        self.viewController = viewController
    }

    func routeToDetailScreen(with collectionId: String) {
        let detailViewController = DetailViewController()
        detailViewController.configurator = DetailConfiguratorImplementation()
        detailViewController.dataStore?.collectionId = collectionId
        viewController.present(detailViewController, animated: true, completion: nil)
    }
}
