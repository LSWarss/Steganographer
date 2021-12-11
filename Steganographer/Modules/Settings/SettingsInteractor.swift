//
//  SettingsInteractor.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 11/12/2021.
//  Copyright (c) 2021. All rights reserved.

import Foundation

protocol SettingsInteractor {
    // TODO: Fill this with public interactor methods
    func getSettings()
}

final class SettingsInteractorImpl {

    private let presenter: SettingsPresenter
    private let worker: SettingsWorker
    private let router: SettingsRouter

    init(presenter: SettingsPresenter,
         worker: SettingsWorker,
         router: SettingsRouter) {
        self.presenter = presenter
        self.worker = worker
        self.router = router
    }
}

extension SettingsInteractorImpl: SettingsInteractor {

    // TODO: Fill this with public interactor methods
    func getSettings() {
        worker.fetchSettings { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .success:
                    self.presenter.presentSettings()
                case .failure(let error):
                    break
            }
        }
    }
}

private extension SettingsInteractorImpl {
    // TODO: Fill this with private interactor methods
}
