//
//  StegoDecodingControllerCreator.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/12/2021.
//  Copyright (c) 2021. All rights reserved.

import Foundation

struct StegoDecodingControllerCreator {

    func getController() -> StegoDecodingController {

        let worker = StegoDecodingWorkerImpl()
        let router = StegoDecodingRouterImpl()
        let presenter = StegoDecodingPresenterImpl<StegoDecodingController>()
        let interactor = StegoDecodingInteractorImpl(presenter: presenter, worker: worker, router: router)
        let controller = StegoDecodingController(interactor: interactor)

        presenter.controller = controller
        router.controller = controller

        return controller
    }
}
