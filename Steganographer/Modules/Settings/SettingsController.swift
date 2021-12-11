//
//  SettingsController.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 11/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol SettingsPresentable: BasePresentable {
    // TODO: Fill this with view setup methods
    func displaySettings()
}

final class SettingsController: BaseViewController {

    private let interactor: SettingsInteractor

    init(interactor: SettingsInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        displaySettings()
        interactor.getSettings()
    }
}

extension SettingsController: SettingsPresentable {

    // TODO: Fill this with view setup methods
    func displaySettings() {
        setupTranslations()
        setupView()
    }
}

private extension SettingsController {

    private func setupTranslations() {
        // TODO: Setup translations for labels here
    }

    private func setupView() {
        // TODO: Setup view here
    }
}
