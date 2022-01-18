//
//  StegoDecodingInteractor.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/12/2021.
//  Copyright (c) 2021. All rights reserved.

import Foundation

protocol StegoDecodingInteractor {
    func getStegoDecoding()
    func goBack()
}

final class StegoDecodingInteractorImpl {

    private let presenter: StegoDecodingPresenter
    private let worker: StegoDecodingWorker
    private let router: StegoDecodingRouter

    init(presenter: StegoDecodingPresenter,
         worker: StegoDecodingWorker,
         router: StegoDecodingRouter) {
        self.presenter = presenter
        self.worker = worker
        self.router = router
    }
}

extension StegoDecodingInteractorImpl: StegoDecodingInteractor {

    func getStegoDecoding() {
        worker.fetchStegoDecoding { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .success:
                    self.presenter.presentStegoDecoding()
                case .failure(let error):
                    self.presenter.presentError(error)
            }
        }
    }
    
    func goBack() {
        router.popViewController()
    }
}

private extension StegoDecodingInteractorImpl {
}
