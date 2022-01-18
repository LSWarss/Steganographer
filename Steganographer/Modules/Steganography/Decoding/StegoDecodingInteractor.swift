//
//  StegoDecodingInteractor.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/12/2021.
//  Copyright (c) 2021. All rights reserved.

import Foundation
import UIKit

protocol StegoDecodingInteractor {
    func goToStegoDecodingWithImage(_ image: UIImage)
}

final class StegoDecodingInteractorImpl {

    private let presenter: StegoDecodingPresenter
    private let router: StegoDecodingRouter

    init(presenter: StegoDecodingPresenter,
         router: StegoDecodingRouter) {
        self.presenter = presenter
        self.router = router
    }
}

extension StegoDecodingInteractorImpl: StegoDecodingInteractor {

    func goToStegoDecodingWithImage(_ image: UIImage) {
        router.showDecodingForChosenImage(image)
    }

}
