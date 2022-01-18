//
//  StegoInformationRouter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol StegoInformationRouter {
    func navigateToStegoInformation()
}

final class StegoInformationRouterImpl {

    weak var controller: UIViewController?

}

extension StegoInformationRouterImpl: StegoInformationRouter {

    func navigateToStegoInformation() {
        // TODO: Change destination controller to something else
        let nextController = StegoInformationControllerCreator().getController()
        controller?.navigationController?.pushViewController(nextController, animated: true)
    }
}

private extension StegoInformationRouterImpl {
    // TODO: Fill this with private router methods
}
