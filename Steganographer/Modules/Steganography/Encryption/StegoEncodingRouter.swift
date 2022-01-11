//
//  StegoEncodingRouter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 14/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol StegoEncodingRouter {
    func popViewController()
}

final class StegoEncodingRouterImpl {
    weak var controller: UIViewController?
}

extension StegoEncodingRouterImpl: StegoEncodingRouter {

    func popViewController() {
        controller?.navigationController?.popViewController(animated: true)
    }

}

private extension StegoEncodingRouterImpl {}
