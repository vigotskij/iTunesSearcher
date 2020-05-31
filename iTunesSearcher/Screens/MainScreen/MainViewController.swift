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
    // MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar? {
        didSet {
            searchBar?.delegate = self
            searchBar?.becomeFirstResponder()
        }
    }
    @IBOutlet weak var tableView: UITableView? {
        didSet {
            tableView?.delegate = self
            tableView?.dataSource = self
            tableView?.register(UINib(nibName: String(describing: MainTableViewCell.self),
                                      bundle: nil),
                                forCellReuseIdentifier: String(describing: MainTableViewCell.self))
        }
    }
    // MARK: - View Model
    private var viewModel: [MainModels.CellViewModel]? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.updateUI()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator = MainConfiguratorImplementation()
    }
}
extension MainViewController: MainView {
    func updateView(with viewModel: MainModels.ViewModel) {
        self.viewModel = viewModel.cellsViewModel
    }

    func routeToDetailScreen() {}
}

// MARK: - Search bar delegate
extension MainViewController: UISearchBarDelegate {
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        guard let searchText = searchBar.text else {
            return false
        }
        output?.search(with: searchText)
        return true
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {
            searchBar.resignFirstResponder()
            return
        }
        output?.search(with: searchText)
        searchBar.resignFirstResponder()
    }
}

// MARK: - Table view delegate & data source
extension MainViewController: UITableViewDelegate {}
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MainTableViewCell.self),
                                                     for: indexPath) as? MainTableViewCell,
            let cellViewModel = self.viewModel?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.set(with: cellViewModel)
        return cell
    }
}
// MARK: - private functions
private extension MainViewController {
    func updateUI() {
        tableView?.reloadData()
    }
}
