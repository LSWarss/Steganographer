//
//  SettingsRouter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 11/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol SettingsRouter {
    func navigateToSettings()
}

final class SettingsRouterImpl {

    weak var controller: UIViewController?

}

extension SettingsRouterImpl: SettingsRouter {

    func navigateToSettings() {
        // TODO: Change destination controller to something else
        let nextController = SettingsControllerCreator().getController()
        controller?.navigationController?.pushViewController(nextController, animated: true)
    }
}

private extension SettingsRouterImpl {
    // TODO: Fill this with private router methods
}
