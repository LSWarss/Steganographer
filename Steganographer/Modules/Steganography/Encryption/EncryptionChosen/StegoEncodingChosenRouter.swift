//
//  StegoEncodingChosenRouter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/01/2022.
//  Copyright (c) 2022. All rights reserved.

import UIKit

protocol StegoEncodingChosenRouter {
    func popViewController()
}

final class StegoEncodingChosenRouterImpl {
    weak var controller: UIViewController?
}

extension StegoEncodingChosenRouterImpl: StegoEncodingChosenRouter {
    
    func popViewController() {
        controller?.navigationController?.popViewController(animated: true)
    }
}
