//
//  DecodingChosenInteractor.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 18/01/2022.
//  Copyright (c) 2022. All rights reserved.

import UIKit
import DisguisedSwiftly

protocol DecodingChosenInteractor {
    func getStegoDecodingChosen()
    func goBackToDashboard()
}

final class DecodingChosenInteractorImpl {

    private let stego: Stego
    private let presenter: DecodingChosenPresenter
    private let router: DecodingChosenRouter
    private let image: UIImage

    init(stego: Stego,
         presenter: DecodingChosenPresenter,
         router: DecodingChosenRouter,
         image: UIImage) {
        self.presenter = presenter
        self.router = router
        self.stego = stego
        self.image = image
    }
}

extension DecodingChosenInteractorImpl: DecodingChosenInteractor {
    
    func getStegoDecodingChosen() {
        stego.decodeTextInImage(in: self.image) { [weak self] result in
            switch result {
            case .success(let message):
                print(message)
                self?.presenter.presentDecodedMessage(message)
            case .failure(let error):
                self?.presenter.presentError(error)
            }
        }
    }
    
    func goBackToDashboard() {
        router.navigateBackToDashboard()
    }
}
