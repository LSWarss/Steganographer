//
//  DecodingRouter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 23/11/2021.
//

import UIKit
import DisguisedSwiftly

protocol DecodingRouter {
    static func createModule() -> UIViewController
}

final class DecodingRouterImpl: DecodingRouter {

    static func createModule() -> UIViewController {
        let viewController = SteganographyDecodingViewController()

        let presenter: DecodingPresenter = DecodingPresenterImpl()

        viewController.presenter = presenter
        viewController.presenter?.router = DecodingRouterImpl()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = DecodingInteractorImpl()
        viewController.presenter?.interactor?.stego = Stego()
        viewController.presenter?.interactor?.presenter = presenter

        return viewController
    }

}
