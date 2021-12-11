//
//  HomeInteractor.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 11/12/2021.
//  Copyright (c) 2021. All rights reserved.

import Foundation

protocol HomeInteractor {
    // TODO: Fill this with public interactor methods
    func getHome()
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

    // TODO: Fill this with public interactor methods
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
}

private extension HomeInteractorImpl {
    // TODO: Fill this with private interactor methods
}
