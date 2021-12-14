//
//  StegoEncodingRouter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 14/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol StegoEncodingRouter {
    func navigateToStegoEncoding()
}

final class StegoEncodingRouterImpl {

    weak var controller: UIViewController?

}

extension StegoEncodingRouterImpl: StegoEncodingRouter {

    func navigateToStegoEncoding() {
        // TODO: Change destination controller to something else
        let nextController = StegoEncodingControllerCreator().getController()
        controller?.navigationController?.pushViewController(nextController, animated: true)
    }
}

private extension StegoEncodingRouterImpl {
    // TODO: Fill this with private router methods
}
