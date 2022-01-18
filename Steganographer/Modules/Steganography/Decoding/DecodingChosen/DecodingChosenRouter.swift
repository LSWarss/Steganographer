//
//  DecodingChosenRouter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 18/01/2022.
//  Copyright (c) 2022. All rights reserved.

import UIKit

protocol DecodingChosenRouter {
    func navigateBackToDashboard()
}

final class DecodingChosenRouterImpl {
    weak var controller: UIViewController?
}

extension DecodingChosenRouterImpl: DecodingChosenRouter {
    
    func navigateBackToDashboard() {
        controller?.navigationController?.popToRootViewController(animated: true)
    }
}
