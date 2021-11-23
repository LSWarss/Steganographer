//
//  EncodingRouter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 23/11/2021.
//

import UIKit
import DisguisedSwiftly

protocol EncodingRouter {
    static func createModule() -> UIViewController
}

final class EncodingRouterImpl: EncodingRouter {

    static func createModule() -> UIViewController {
        let viewController = SteganographyEncodingViewController()

        let presenter: EncodingPresenter = EncodingPresenterImpl()

        viewController.presenter = presenter
        viewController.presenter?.router = EncodingRouterImpl()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = EncodingInteractorImpl()
        viewController.presenter?.interactor?.stego = Stego()
        viewController.presenter?.interactor?.presenter = presenter

        return viewController
    }

}
