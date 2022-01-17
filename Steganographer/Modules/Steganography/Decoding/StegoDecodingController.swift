//
//  StegoDecodingController.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol StegoDecodingPresentable: BasePresentable {
    func displayStegoDecoding()
}

final class StegoDecodingController: BaseViewController {

    private let interactor: StegoDecodingInteractor

    @IBOutlet weak var appHeader: AppHeaderView!
    
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

    func displayStegoDecoding() {
        setupTranslations()
    }
}

private extension StegoDecodingController {

    private func setupTranslations() {
        appHeader.setup(in: self, title: Strings.Steganography.Decoding.title)
    }
}
