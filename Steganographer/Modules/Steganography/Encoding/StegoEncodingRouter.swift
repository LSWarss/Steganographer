//
//  StegoEncodingRouter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 14/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol StegoEncodingRouter {
    func popViewController()
    func showEncryptionForChosenImage(_ image: UIImage)
}

final class StegoEncodingRouterImpl {
    weak var controller: UIViewController?
}

extension StegoEncodingRouterImpl: StegoEncodingRouter {

    func popViewController() {
        controller?.navigationController?.popViewController(animated: true)
    }

    func showEncryptionForChosenImage(_ image: UIImage) {
        let chosenEncryptionController = StegoEncodingChosenControllerCreator().getController(with: image)
        controller?.navigationController?.pushViewController(chosenEncryptionController, animated: true)
    }
    
}

private extension StegoEncodingRouterImpl {}
