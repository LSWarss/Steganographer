//
//  SettingsPresenter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 11/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol SettingsPresenter: BasePresenter {
    // TODO: Fill this with public interactor methods
    func presentSettings()
}

final class SettingsPresenterImpl<T: SettingsPresentable>: BasePresenterImpl<T> { }

extension SettingsPresenterImpl: SettingsPresenter {

    // TODO: Fill this with public interactor methods
    func presentSettings() {
        controller?.displaySettings()
    }
}

private extension SettingsPresenterImpl {
    // TODO: Fill this with private interactor methods
}
