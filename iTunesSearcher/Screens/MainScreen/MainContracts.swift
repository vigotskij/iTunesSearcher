//
//  MainContracts.swift
//  iTunesSearcher
//
//  Created by Boris Sortino on 10/05/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//
// MARK: init helper
protocol MainConfigurator {
    func configure(with viewController: MainViewController)
}
// MARK: Routing
protocol MainRouter {}
// MARK: Inner structure
protocol MainInteractor: Interactor {
    func viewDidLoad()
}
protocol MainPresenter: Presenter {}
protocol MainView: View {}
// MARK: Readability
protocol ViewOutput: MainInteractor {}
protocol InteractorOutput: MainPresenter {}
protocol PresenterOutput: MainView {}
