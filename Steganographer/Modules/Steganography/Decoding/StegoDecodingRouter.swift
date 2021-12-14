//
//  StegoDecodingRouter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol StegoDecodingRouter {
    func navigateToStegoDecoding()
}

final class StegoDecodingRouterImpl {

    weak var controller: UIViewController?

}

extension StegoDecodingRouterImpl: StegoDecodingRouter {

    func navigateToStegoDecoding() {
        // TODO: Change destination controller to something else
        let nextController = StegoDecodingControllerCreator().getController()
        controller?.navigationController?.pushViewController(nextController, animated: true)
    }
}

private extension StegoDecodingRouterImpl {
    // TODO: Fill this with private router methods
}
