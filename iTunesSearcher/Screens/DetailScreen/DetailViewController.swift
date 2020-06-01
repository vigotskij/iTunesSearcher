//
//  DetailViewController.swift
//  foodRecipesSearcher
//
//  Created by Boris Sortino on 17/05/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

import UIKit
final class DetailViewController: UIViewController {
    weak var router: DetailRouter?
    var output: DetailInteractor?
    var dataStore: DetailDataStore?
    var configurator: DetailConfigurator? {
        didSet {
            configurator?.configure(with: self)
        }
    }
    // MARK: - View model
    private var viewModel: DetailModels.ViewModel? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.updateUI()
            }
        }
    }
    // MARK: - Outlets
    @IBOutlet private weak var coverImage: UIImageView?
}
extension DetailViewController: DetailView {
    func updateView(with viewModel: DetailModels.ViewModel) {
        self.viewModel = viewModel
    }
}
private extension DetailViewController {
    func updateUI() {
        coverImage?.image = viewModel?.coverImage
    }
}
// MARK: - Life cycle
extension DetailViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }
}
