//
//  StegoEncodingChosenInteractor.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/01/2022.
//  Copyright (c) 2022. All rights reserved.

import UIKit
import DisguisedSwiftly

protocol StegoEncodingChosenInteractor {
    func getStegoEncodingChosen()
    func encodeImageWithText(_ text: String)
    func goToDashboard()
}

final class StegoEncodingChosenInteractorImpl {

    private let stego: Stego
    private let presenter: StegoEncodingChosenPresenter
    private let router: StegoEncodingChosenRouter
    private let image: UIImage

    init(stego: Stego,
         presenter: StegoEncodingChosenPresenter,
         router: StegoEncodingChosenRouter,
         image: UIImage) {
        self.stego = stego
        self.presenter = presenter
        self.router = router
        self.image = image
    }
}

extension StegoEncodingChosenInteractorImpl: StegoEncodingChosenInteractor {

    func getStegoEncodingChosen() {
        self.presenter.presentStegoEncodingChosen(with: self.image)
    }
    
    func encodeImageWithText(_ text: String) {
        stego.encodeTextInImage(with: text, in: self.image) { [weak self] result in
            switch result {
            case .success(let image):
                guard let image = image else {
                    assertionFailure("There is no image 🙈")
                    return
                }
                
                self?.presenter.presentImageSavingForImage(image)
            case .failure(let error):
                self?.presenter.presentError(error)
            }
        }
    }
    
    func goToDashboard() {
        router.goBackToDashboard()
    }
}

private extension StegoEncodingChosenInteractorImpl {}
