//
//  MainContracts.swift
//  iTunesSearcher
//
//  Created by Boris Sortino on 10/05/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//
// MARK: - init helper
protocol MainConfigurator: Configurator {
    func configure(with viewController: MainViewController)
}
// MARK: - Routing
protocol MainRouter: Router {
    func routeToDetailScreen(with collectionId: String)
}
// MARK: - Inner structure
protocol MainInteractor: Interactor {
    func viewDidLoad()
    func search(with term: String)
    func routeToDetailScreen(with item: Int)
}
protocol MainPresenter {
    func updatePresentedState(with data: MainModels.DataModel)
    func routeToDetailScreen(with collectionId: String)
}
protocol MainView: View {
    func updateView(with viewModel: MainModels.ViewModel)
    func routeToDetailScreen(with collectionId: String)
}
