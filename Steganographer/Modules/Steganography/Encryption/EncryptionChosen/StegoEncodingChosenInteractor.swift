//
//  StegoEncodingChosenInteractor.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/01/2022.
//  Copyright (c) 2022. All rights reserved.

import Foundation
import UIKit

protocol StegoEncodingChosenInteractor {
    func goBack()
    func getStegoEncodingChosen()
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
        worker.fetchStegoEncodingChosen { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .success:
                self.presenter.presentStegoEncodingChosen(with: self.image)
                case .failure(let error):
                    break
            }
        }
    }
    
    func goBack() {
        router.popViewController()
    }
}

private extension StegoEncodingChosenInteractorImpl {}
