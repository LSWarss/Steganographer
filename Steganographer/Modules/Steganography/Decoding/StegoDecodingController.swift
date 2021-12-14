//
//  StegoDecodingController.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol StegoDecodingPresentable: BasePresentable {
    // TODO: Fill this with view setup methods
    func displayStegoDecoding()
}

final class StegoDecodingController: BaseViewController {

    private let interactor: StegoDecodingInteractor

    init(interactor: StegoDecodingInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        displayStegoDecoding()
        interactor.getStegoDecoding()
    }
}

extension StegoDecodingController: StegoDecodingPresentable {

    // TODO: Fill this with view setup methods
    func displayStegoDecoding() {
        setupTranslations()
        setupView()
    }
}

private extension StegoDecodingController {

    private func setupTranslations() {
        // TODO: Setup translations for labels here
    }

    private func setupView() {
        // TODO: Setup view here
    }
}
