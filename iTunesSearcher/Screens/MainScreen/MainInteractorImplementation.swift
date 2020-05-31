//
//  MainInteractorImplementation.swift
//  iTunesSearcher
//
//  Created by Boris Sortino on 10/05/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//
final class MainInteractorImplementation {
    private var output: MainPresenter?
    init(output: MainPresenter) {
        self.output = output
    }
}
extension MainInteractorImplementation: MainInteractor {
    func search(with term: String) {}

    func routeToDetailScreen(with: String) {}

    func viewDidLoad() {}
}
