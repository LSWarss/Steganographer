//
//  StegoInformationControllerCreator.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/12/2021.
//  Copyright (c) 2021. All rights reserved.

import Foundation

struct StegoInformationControllerCreator {

    func getController() -> StegoInformationController {

        let worker = StegoInformationWorkerImpl()
        let router = StegoInformationRouterImpl()
        let presenter = StegoInformationPresenterImpl<StegoInformationController>()
        let interactor = StegoInformationInteractorImpl(presenter: presenter, worker: worker, router: router)
        let controller = StegoInformationController(interactor: interactor)

        presenter.controller = controller
        router.controller = controller

        return controller
    }
}
