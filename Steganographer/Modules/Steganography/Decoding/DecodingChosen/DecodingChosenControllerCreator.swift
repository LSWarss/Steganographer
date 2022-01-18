//
//  DecodingChosenControllerCreator.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 18/01/2022.
//  Copyright (c) 2022. All rights reserved.

import Foundation
import DisguisedSwiftly
import UIKit

struct DecodingChosenControllerCreator {

    func getController(with image: UIImage) -> DecodingChosenController {

        let router = DecodingChosenRouterImpl()
        let presenter = DecodingChosenPresenterImpl<DecodingChosenController>()
        let interactor = DecodingChosenInteractorImpl(stego: Stego(), presenter: presenter, router: router, image: image)
        let controller = DecodingChosenController(interactor: interactor)

        presenter.controller = controller
        router.controller = controller

        return controller
    }
}
