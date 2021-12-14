//
//  HomeInteractor.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 11/12/2021.
//  Copyright (c) 2021. All rights reserved.

import Foundation

protocol HomeInteractor {
    func getHome()
    func getStegoEncoding()
    func getStegoDecoding()
    func getStegoHistory()
    func getStegoInformation()
}

final class HomeInteractorImpl {

    private let presenter: HomePresenter
    private let worker: HomeWorker
    private let router: HomeRouter

    init(presenter: HomePresenter,
         worker: HomeWorker,
         router: HomeRouter) {
        self.presenter = presenter
        self.worker = worker
        self.router = router
    }
}

extension HomeInteractorImpl: HomeInteractor {

    func getHome() {
        worker.fetchHome { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success:
                self.presenter.presentHome()
            case .failure(let error):
                break
            }
        }
    }

    func getStegoEncoding() {
        router.navigateToEncrypt {
            log(.info, .layout, "Navigating to Stego Encoding View")
        }
    }

    func getStegoDecoding() {
        router.navigateToDecrypt {
            log(.info, .layout, "Navigating to Stego Decoding View")
        }
    }

    func getStegoInformation() {
        router.navigateToInformation {
            log(.info, .layout, "Navigating to Stego Information View")
        }
    }

    func getStegoHistory() {
        router.navigateToHistory {
            log(.info, .layout, "Navigating to Stego History View")
        }
    }
}

private extension HomeInteractorImpl {
    // TODO: Fill this with private interactor methods
}
