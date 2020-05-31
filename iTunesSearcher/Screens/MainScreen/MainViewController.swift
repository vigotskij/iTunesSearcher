//
//  MainViewController.swift
//  iTunesSearcher
//
//  Created by Boris Sortino on 10/05/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
    weak var router: MainRouter?
    var output: MainInteractor?
    private var configurator: MainConfigurator? {
        didSet {
            configurator?.configure(with: self)
            configurator = nil
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator = MainConfiguratorImplementation()
    }
}
extension MainViewController: MainView {
    func updateView(with viewModel: [MainModels.CellViewModel]) {}

    func routeToDetailScreen() {}
}
