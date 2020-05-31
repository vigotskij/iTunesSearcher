//
//  MainPresenterImplementation.swift
//  iTunesSearcher
//
//  Created by Boris Sortino on 10/05/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//
final class MainPresenterImplementation {
    private var output: MainView?
    init(output: MainView) {
        self.output = output
    }
}
extension MainPresenterImplementation: MainPresenter {
    func updatePresentedState(with data: [MainModels.DataModel]) {}

    func routeToDetailScreen() {}
}
