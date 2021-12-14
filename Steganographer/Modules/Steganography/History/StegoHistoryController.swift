//
//  StegoHistoryController.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol StegoHistoryPresentable: BasePresentable {
    // TODO: Fill this with view setup methods
    func displayStegoHistory()
}

final class StegoHistoryController: BaseViewController {

    private let interactor: StegoHistoryInteractor

    init(interactor: StegoHistoryInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        displayStegoHistory()
        interactor.getStegoHistory()
    }
}

extension StegoHistoryController: StegoHistoryPresentable {

    // TODO: Fill this with view setup methods
    func displayStegoHistory() {
        setupTranslations()
        setupView()
    }
}

private extension StegoHistoryController {

    private func setupTranslations() {
        // TODO: Setup translations for labels here
    }

    private func setupView() {
        // TODO: Setup view here
    }
}
