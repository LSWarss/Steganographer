//
//  StegoEncodingChosenControllerCreator.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/01/2022.
//  Copyright (c) 2022. All rights reserved.

import UIKit
import DisguisedSwiftly

struct StegoEncodingChosenControllerCreator {

    func getController(with image: UIImage) -> StegoEncodingChosenController {

        let router = StegoEncodingChosenRouterImpl()
        let presenter = StegoEncodingChosenPresenterImpl<StegoEncodingChosenController>()
        let interactor = StegoEncodingChosenInteractorImpl(stego: Stego(), presenter: presenter, router: router, image: image)
        let controller = StegoEncodingChosenController(interactor: interactor)

        presenter.controller = controller
        router.controller = controller

        return controller
    }
}
