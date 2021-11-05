//
//  SteganographyRouter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 04/11/2021.
//

import Foundation
import UIKit
import DisguisedSwiftly

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry: EntryPoint? { get }

    static func start() -> AnyRouter
}

class UserRouter: AnyRouter {
    var entry: EntryPoint?

    static func start() -> AnyRouter {

        let router = UserRouter()
        var view: AnyView = SteganographyViewController()
        var interactor: AnyInteractor = SteganographyInteractor(stego: Stego())
        let presenter: AnyPresenter = SteganographyPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter

        router.entry = view as? EntryPoint

        return router
    }

}
