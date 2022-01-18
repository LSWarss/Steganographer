//
//  ProfileInteractor.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 11/12/2021.
//  Copyright (c) 2021. All rights reserved.

import Foundation

protocol ProfileInteractor {
    // TODO: Fill this with public interactor methods
    func getProfile()
}

final class ProfileInteractorImpl {

    private let presenter: ProfilePresenter
    private let worker: ProfileWorker
    private let router: ProfileRouter

    init(presenter: ProfilePresenter,
         worker: ProfileWorker,
         router: ProfileRouter) {
        self.presenter = presenter
        self.worker = worker
        self.router = router
    }
}

extension ProfileInteractorImpl: ProfileInteractor {

    // TODO: Fill this with public interactor methods
    func getProfile() {
        worker.fetchProfile { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .success:
                    self.presenter.presentProfile()
                case .failure(let error):
                    self.presenter.presentError(error)
            }
        }
    }
}

private extension ProfileInteractorImpl {
    // TODO: Fill this with private interactor methods
}
