//
//  StegoEncodingInteractor.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 14/12/2021.
//  Copyright (c) 2021. All rights reserved.

import Foundation
import UIKit

protocol StegoEncodingInteractor {
    func goToStegoEncodingWithImage(_ image: UIImage)
}

final class StegoEncodingInteractorImpl {

    private let presenter: StegoEncodingPresenter
    private let router: StegoEncodingRouter

    init(presenter: StegoEncodingPresenter,
         router: StegoEncodingRouter) {
        self.presenter = presenter
        self.router = router
    }
}

extension StegoEncodingInteractorImpl: StegoEncodingInteractor {

    func goToStegoEncodingWithImage(_ image: UIImage) {
        router.showEncryptionForChosenImage(image)
    }
}
