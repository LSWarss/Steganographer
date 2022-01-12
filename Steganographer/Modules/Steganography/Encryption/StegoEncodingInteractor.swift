//
//  StegoEncodingInteractor.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 14/12/2021.
//  Copyright (c) 2021. All rights reserved.

import Foundation
import UIKit

protocol StegoEncodingInteractor {
    func getStegoEncoding()
    func goBack()
    func goToStegoEncodingWithImage(_ image: UIImage)
}

final class StegoEncodingInteractorImpl {

    private let presenter: StegoEncodingPresenter
    private let worker: StegoEncodingWorker
    private let router: StegoEncodingRouter

    init(presenter: StegoEncodingPresenter,
         worker: StegoEncodingWorker,
         router: StegoEncodingRouter) {
        self.presenter = presenter
        self.worker = worker
        self.router = router
    }
}

extension StegoEncodingInteractorImpl: StegoEncodingInteractor {

    func getStegoEncoding() {
        worker.fetchStegoEncoding { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success:
                self.presenter.presentStegoEncoding()
            case .failure(let error):
                log(.error, .call, error.localizedDescription)
            }
        }
    }

    func goBack() {
        router.popViewController()
    }

    func goToStegoEncodingWithImage(_ image: UIImage) {
        router.showEncryptionForChosenImage(image)
    }
}
