//
//  StegoHistoryInteractor.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/12/2021.
//  Copyright (c) 2021. All rights reserved.

import Foundation

protocol StegoHistoryInteractor {
    // TODO: Fill this with public interactor methods
    func getStegoHistory()
}

final class StegoHistoryInteractorImpl {

    private let presenter: StegoHistoryPresenter
    private let worker: StegoHistoryWorker
    private let router: StegoHistoryRouter

    init(presenter: StegoHistoryPresenter,
         worker: StegoHistoryWorker,
         router: StegoHistoryRouter) {
        self.presenter = presenter
        self.worker = worker
        self.router = router
    }
}

extension StegoHistoryInteractorImpl: StegoHistoryInteractor {

    // TODO: Fill this with public interactor methods
    func getStegoHistory() {
        worker.fetchStegoHistory { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .success:
                    self.presenter.presentStegoHistory()
                case .failure(let error):
                    break
            }
        }
    }
}

private extension StegoHistoryInteractorImpl {
    // TODO: Fill this with private interactor methods
}
