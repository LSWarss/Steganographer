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
    func encodeImage(with text: String) -> UIImage?
}

final class StegoEncodingChosenInteractorImpl {

    private let presenter: StegoEncodingChosenPresenter
    private let worker: StegoEncodingChosenWorker
    private let router: StegoEncodingChosenRouter
    private let image: UIImage

    init(presenter: StegoEncodingChosenPresenter,
         worker: StegoEncodingChosenWorker,
         router: StegoEncodingChosenRouter,
         image: UIImage) {
        self.presenter = presenter
        self.worker = worker
        self.router = router
        self.image = image
    }
}

extension StegoEncodingChosenInteractorImpl: StegoEncodingChosenInteractor {

    func getStegoEncodingChosen() {
        self.presenter.presentStegoEncodingChosen(with: self.image)
    }
    
    func encodeImage(with text: String) -> UIImage? {
        let stego = Stego()
        
        return stego.encodeTextInImage(with: text, image: self.image) { progress in
            switch progress {
            case .ended:
                print("Ended encoding")
            case .working:
                break
            case .failed:
                break
            }
        }
    }
}

private extension StegoEncodingChosenInteractorImpl {}
