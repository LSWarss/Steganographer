//
//  HomeControllerCreator.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 11/12/2021.
//  Copyright (c) 2021. All rights reserved.

import Foundation

struct HomeControllerCreator {

    func getController() -> HomeController {

        let worker = HomeWorkerImpl()
        let router = HomeRouterImpl()
        let presenter = HomePresenterImpl<HomeController>()
        let interactor = HomeInteractorImpl(presenter: presenter, worker: worker, router: router)
        let controller = HomeController(interactor: interactor)

        presenter.controller = controller
        router.controller = controller

        return controller
    }
}
