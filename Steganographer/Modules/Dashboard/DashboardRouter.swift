//
//  SteganographyRouter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 04/11/2021.
//

import UIKit

protocol DashboardRouter: AnyObject {

    static func createModule() -> UINavigationController
    func pushToEncoding(on view: SteganographyDashboardView)
    func pushToDecoding(on view: SteganographyDashboardView)
    func pushToInfo(on view: SteganographyDashboardView)
    func pushToHistory(on view: SteganographyDashboardView)
}

class DashboardRouterImpl: DashboardRouter {

    static func createModule() -> UINavigationController {
        let viewController = DashboardViewController()
        let navigationController = UINavigationController(rootViewController: viewController)

        let presenter: DashboardPresenter = DashboardPresenterImpl()

        viewController.presenter = presenter
        viewController.presenter?.router = DashboardRouterImpl()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = DashboardInteractorImpl()
        viewController.presenter?.interactor?.presenter = presenter

        return navigationController
    }

    func pushToEncoding(on view: SteganographyDashboardView) {
        let encodingViewController = EncodingRouterImpl.createModule()

        let viewController = view as? DashboardViewController
        viewController?.navigationController?.pushViewController(encodingViewController, animated: true)
    }

    func pushToDecoding(on view: SteganographyDashboardView) {
        let decodingViewController = DecodingRouterImpl.createModule()

        let viewController = view as? DashboardViewController
        viewController?.navigationController?.pushViewController(decodingViewController, animated: true)
    }

    func pushToInfo(on view: SteganographyDashboardView) {
        print("Will push to info in future")
    }

    func pushToHistory(on view: SteganographyDashboardView) {
        print("Will push to history in future")
    }

}
