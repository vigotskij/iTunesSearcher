//
//  MainInteractorImplementation.swift
//  iTunesSearcher
//
//  Created by Boris Sortino on 10/05/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//
import Foundation
final class MainInteractorImplementation {
    private var output: MainPresenter?
    init(output: MainPresenter) {
        self.output = output
    }
    private var interceptor: RequestInterceptor = PaginationRequestInterceptor()
    private var retrievedResponses: MainModels.Response = .init(rawData: []) {
        didSet {
            output?.updatePresentedState(with: MainModels.DataModel(from: retrievedResponses))
        }
    }
}
extension MainInteractorImplementation: MainInteractor {
    func search(with term: String) {
        guard let endpoint = Endpoints.main(term).value,
            !term.isEmpty else {
                return
        }
        resetInterceptor()
        URLSession.shared
            .retrieveData(with: endpoint,
                          interceptor: interceptor,
                          completionHandler: { [weak self] (response: ITunesResponseContainer?, _, error) in
                            guard
                                let self = self,
                                let response = response else {
                                    #if DEBUG
                                    print(error?.localizedDescription ?? "Unknown error while retrieving data.")
                                    #endif
                                    return
                            }
                            let filteredResponse = response.results.filter {$0.wrapperType == .track}
                            self.retrievedResponses = .init(rawData: filteredResponse)
            })
    }

    func routeToDetailScreen(with item: Int) {
        guard let collectionId = retrievedResponses.rawData[item].collectionIdString else {
            return
        }
        output?.routeToDetailScreen(with: collectionId)
    }

    func viewDidLoad() {}
}
// MARK: - private functions
private extension MainInteractorImplementation {
    func resetInterceptor() {
        interceptor = PaginationRequestInterceptor()
    }
}
