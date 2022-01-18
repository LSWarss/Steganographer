//
//  HomeRouter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 11/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol HomeRouter {
    func navigateToEncrypt(completion: @escaping SimpleAction)
    func navigateToDecrypt(completion: @escaping SimpleAction)
    func navigateToInformation(completion: @escaping SimpleAction)
    func navigateToHistory(completion: @escaping SimpleAction)
}

final class HomeRouterImpl {
    weak var controller: UIViewController?
}

extension HomeRouterImpl: HomeRouter {

    func navigateToEncrypt(completion: @escaping SimpleAction) {
        let encodingVC = StegoEncodingControllerCreator().getController()
        controller?.navigationController?.pushViewController(encodingVC, animated: true)
    }

    func navigateToDecrypt(completion: @escaping SimpleAction) {
        let decodingVC = StegoDecodingControllerCreator().getController()
        controller?.navigationController?.pushViewController(decodingVC, animated: true)
    }

    func navigateToInformation(completion: @escaping SimpleAction) {
        let informationVC = StegoInformationControllerCreator().getController()
        controller?.navigationController?.pushViewController(informationVC, animated: true)
    }

    func navigateToHistory(completion: @escaping SimpleAction) {
        let historyVC = StegoHistoryControllerCreator().getController()
        controller?.navigationController?.pushViewController(historyVC, animated: true)
    }

}

private extension HomeRouterImpl {
    // TODO: Fill this with private router methods
}
