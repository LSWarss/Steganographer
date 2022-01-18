//
//  ProfileControllerCreator.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 11/12/2021.
//  Copyright (c) 2021. All rights reserved.

import Foundation

struct ProfileControllerCreator {

    func getController() -> ProfileController {

        let worker = ProfileWorkerImpl()
        let router = ProfileRouterImpl()
        let presenter = ProfilePresenterImpl<ProfileController>()
        let interactor = ProfileInteractorImpl(presenter: presenter, worker: worker, router: router)
        let controller = ProfileController(interactor: interactor)

        presenter.controller = controller
        router.controller = controller

        return controller
    }
}
