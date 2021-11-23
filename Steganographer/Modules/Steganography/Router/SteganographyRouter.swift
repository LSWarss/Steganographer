//
//  SteganographyRouter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 04/11/2021.
//

import Foundation
import UIKit
import DisguisedSwiftly

// MARK: Router Input (Presenter -> Router)
protocol SteganographyRouter: AnyObject {

    static func createModule() -> UINavigationController
    func pushToEncoding(on view: EncodingView)
    func pushToDecoding(on view: DecodingView)
    func pushToInfo(on view: InfoView)
    func pushToHistory(on view: HistoryView)
}

class SteganographyRouterImpl: SteganographyRouter {

    static func createModule() -> UINavigationController {
        let viewController = SteganographyViewController()
        let navigationController = UINavigationController(rootViewController: viewController)

        let presenter: SteganographyPresenter = SteganographyPresenterImpl()

        viewController.presenter = presenter
        viewController.presenter?.router = SteganographyRouterImpl()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = SteganographyInteractorImpl(stego: Stego())
        viewController.presenter?.interactor?.presenter = presenter

        return navigationController
    }

    func pushToEncoding(on view: EncodingView) {

    }

    func pushToDecoding(on view: DecodingView) {

    }

    func pushToInfo(on view: InfoView) {

    }

    func pushToHistory(on view: HistoryView) {

    }

//
//    static func start() -> UINavigationController {
//
//        let router = SteganographyRouter()
//        var view: SteganographyView = SteganographyViewController()
//        var interactor: StanographyInteractor = SteganographyInteractorImpl(stego: Stego())
//        let presenter: SteganographyPresenter = SteganographyPresenter(view: view, interactor: interactor, router: router)
//        view.presenter = presenter
//        interactor.presenter = presenter
//
//        router.entry = view
//
//        return router
//    }

    func showEncoding() {

    }

}
