//
//  StegoDecodingRouter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol StegoDecodingRouter {
    func popViewController()
}

final class StegoDecodingRouterImpl {

    weak var controller: UIViewController?

}

extension StegoDecodingRouterImpl: StegoDecodingRouter {
    
    func popViewController() {
        controller?.navigationController?.popViewController(animated: true)
    }
    
}

private extension StegoDecodingRouterImpl {
    // TODO: Fill this with private router methods
}
