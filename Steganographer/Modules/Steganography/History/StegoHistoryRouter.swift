//
//  StegoHistoryRouter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol StegoHistoryRouter {
    func navigateToStegoHistory()
}

final class StegoHistoryRouterImpl {

    weak var controller: UIViewController?

}

extension StegoHistoryRouterImpl: StegoHistoryRouter {

    func navigateToStegoHistory() {
        // TODO: Change destination controller to something else
        let nextController = StegoHistoryControllerCreator().getController()
        controller?.navigationController?.pushViewController(nextController, animated: true)
    }
}

private extension StegoHistoryRouterImpl {
    // TODO: Fill this with private router methods
}
