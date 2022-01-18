//
//  StegoDecodingRouter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol StegoDecodingRouter {
    func showDecodingForChosenImage(_ image: UIImage)
}

final class StegoDecodingRouterImpl {
    weak var controller: UIViewController?
}

extension StegoDecodingRouterImpl: StegoDecodingRouter {
    
    func showDecodingForChosenImage(_ image: UIImage) {
        let stegoDecodingChosenController = DecodingChosenControllerCreator().getController(with: image)
        controller?.navigationController?.pushViewController(stegoDecodingChosenController, animated: true)
    }
}
