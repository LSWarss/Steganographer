//
//  StegoInformationInteractor.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/12/2021.
//  Copyright (c) 2021. All rights reserved.

import Foundation

protocol StegoInformationInteractor {
    // TODO: Fill this with public interactor methods
    func getStegoInformation()
}

final class StegoInformationInteractorImpl {

    private let presenter: StegoInformationPresenter
    private let worker: StegoInformationWorker
    private let router: StegoInformationRouter

    init(presenter: StegoInformationPresenter,
         worker: StegoInformationWorker,
         router: StegoInformationRouter) {
        self.presenter = presenter
        self.worker = worker
        self.router = router
    }
}

extension StegoInformationInteractorImpl: StegoInformationInteractor {

    // TODO: Fill this with public interactor methods
    func getStegoInformation() {
        worker.fetchStegoInformation { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .success:
                    self.presenter.presentStegoInformation()
                case .failure(let error):
                    break
            }
        }
    }
}

private extension StegoInformationInteractorImpl {
    // TODO: Fill this with private interactor methods
}
