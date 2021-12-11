//
//  HomeRouter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 11/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol HomeRouter {
    func navigateToHome()
}

final class HomeRouterImpl {

    weak var controller: UIViewController?

}

extension HomeRouterImpl: HomeRouter {

    func navigateToHome() {
        // TODO: Change destination controller to something else
        let nextController = HomeControllerCreator().getController()
        controller?.navigationController?.pushViewController(nextController, animated: true)
    }
}

private extension HomeRouterImpl {
    // TODO: Fill this with private router methods
}
