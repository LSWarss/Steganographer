//
//  StegoEncodingController.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 14/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol StegoEncodingPresentable: BasePresentable {
    // TODO: Fill this with view setup methods
    func displayStegoEncoding()
}

final class StegoEncodingController: BaseViewController {

    private let interactor: StegoEncodingInteractor

    init(interactor: StegoEncodingInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        displayStegoEncoding()
        interactor.getStegoEncoding()
    }
}

extension StegoEncodingController: StegoEncodingPresentable {

    // TODO: Fill this with view setup methods
    func displayStegoEncoding() {
        setupTranslations()
        setupView()
    }
}

private extension StegoEncodingController {

    private func setupTranslations() {
        // TODO: Setup translations for labels here
    }

    private func setupView() {
        // TODO: Setup view here
    }
}
