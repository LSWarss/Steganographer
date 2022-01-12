//
//  StegoEncodingChosenControllerCreator.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/01/2022.
//  Copyright (c) 2022. All rights reserved.

import UIKit

struct StegoEncodingChosenControllerCreator {

    func getController(with image: UIImage) -> StegoEncodingChosenController {

        let worker = StegoEncodingChosenWorkerImpl()
        let router = StegoEncodingChosenRouterImpl()
        let presenter = StegoEncodingChosenPresenterImpl<StegoEncodingChosenController>()
        let interactor = StegoEncodingChosenInteractorImpl(presenter: presenter, worker: worker, router: router, image: image)
        let controller = StegoEncodingChosenController(interactor: interactor)

        presenter.controller = controller
        router.controller = controller

        return controller
    }
}
