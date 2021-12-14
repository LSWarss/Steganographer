//
//  StegoInformationController.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol StegoInformationPresentable: BasePresentable {
    // TODO: Fill this with view setup methods
    func displayStegoInformation()
}

final class StegoInformationController: BaseViewController {

    private let interactor: StegoInformationInteractor

    init(interactor: StegoInformationInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        displayStegoInformation()
        interactor.getStegoInformation()
    }
}

extension StegoInformationController: StegoInformationPresentable {

    // TODO: Fill this with view setup methods
    func displayStegoInformation() {
        setupTranslations()
        setupView()
    }
}

private extension StegoInformationController {

    private func setupTranslations() {
        // TODO: Setup translations for labels here
    }

    private func setupView() {
        // TODO: Setup view here
    }
}
