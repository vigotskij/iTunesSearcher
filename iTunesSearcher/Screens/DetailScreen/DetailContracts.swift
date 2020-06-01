//
//  DetailContracts.swift
//  foodRecipesSearcher
//
//  Created by Boris Sortino on 17/05/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

protocol DetailConfigurator: Configurator {
    func configure(with viewController: DetailViewController)
}
protocol DetailRouter: Router {
    func dismiss()
}
protocol DetailDataStore: DataStore {
    var collectionId: String { get set }
}
protocol DetailInteractor: Interactor {
    func viewDidLoad()
}
protocol DetailPresenter: Presenter {
    func presentData(with processedData: DetailModels.DataModel)
}
protocol DetailView: View {
    func updateView(with viewModel: DetailModels.ViewModel)
}
