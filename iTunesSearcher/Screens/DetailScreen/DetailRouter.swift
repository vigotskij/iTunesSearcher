//
//  DetailRouter.swift
//  foodRecipesSearcher
//
//  Created by Boris Sortino on 17/05/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

final class DetailRouterImplementation: DetailRouter {
    let viewController: DetailViewController
    
    init(viewController: DetailViewController) {
        self.viewController = viewController
    }
    
    func dismiss() {
        viewController.dismiss(animated: true, completion: nil)
    }
}
