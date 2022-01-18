//
//  StegoEncodingControllerCreator.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 14/12/2021.
//  Copyright (c) 2021. All rights reserved.

import Foundation

struct StegoEncodingControllerCreator {

    func getController() -> StegoEncodingController {

        let router = StegoEncodingRouterImpl()
        let presenter = StegoEncodingPresenterImpl<StegoEncodingController>()
        let interactor = StegoEncodingInteractorImpl(presenter: presenter,
                                                     router: router)
        let controller = StegoEncodingController(interactor: interactor)

        presenter.controller = controller
        router.controller = controller

        return controller
    }
}
