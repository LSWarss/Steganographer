//
//  ProfileRouter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 11/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol ProfileRouter {
    func navigateToProfile()
}

final class ProfileRouterImpl {

    weak var controller: UIViewController?

}

extension ProfileRouterImpl: ProfileRouter {

    func navigateToProfile() {
        // TODO: Change destination controller to something else
        let nextController = ProfileControllerCreator().getController()
        controller?.navigationController?.pushViewController(nextController, animated: true)
    }
}

private extension ProfileRouterImpl {
    // TODO: Fill this with private router methods
}
