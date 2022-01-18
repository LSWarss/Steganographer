//
//  StegoEncodingChosenRouter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/01/2022.
//  Copyright (c) 2022. All rights reserved.

import UIKit

protocol StegoEncodingChosenRouter {
    func goBackToDashboard()
}

final class StegoEncodingChosenRouterImpl {
    weak var controller: UIViewController?
}

extension StegoEncodingChosenRouterImpl: StegoEncodingChosenRouter {
    
    func goBackToDashboard() {
        controller?.navigationController?.popToRootViewController(animated: true)
    }
}
