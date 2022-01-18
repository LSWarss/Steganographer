//
//  StegoHistoryControllerCreator.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/12/2021.
//  Copyright (c) 2021. All rights reserved.

import Foundation

struct StegoHistoryControllerCreator {

    func getController() -> StegoHistoryController {

        let worker = StegoHistoryWorkerImpl()
        let router = StegoHistoryRouterImpl()
        let presenter = StegoHistoryPresenterImpl<StegoHistoryController>()
        let interactor = StegoHistoryInteractorImpl(presenter: presenter, worker: worker, router: router)
        let controller = StegoHistoryController(interactor: interactor)

        presenter.controller = controller
        router.controller = controller

        return controller
    }
}
