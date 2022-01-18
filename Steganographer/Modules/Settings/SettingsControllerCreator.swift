//
//  SettingsControllerCreator.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 11/12/2021.
//  Copyright (c) 2021. All rights reserved.

import Foundation

struct SettingsControllerCreator {

    func getController() -> SettingsController {

        let worker = SettingsWorkerImpl()
        let router = SettingsRouterImpl()
        let presenter = SettingsPresenterImpl<SettingsController>()
        let interactor = SettingsInteractorImpl(presenter: presenter, worker: worker, router: router)
        let controller = SettingsController(interactor: interactor)

        presenter.controller = controller
        router.controller = controller

        return controller
    }
}
