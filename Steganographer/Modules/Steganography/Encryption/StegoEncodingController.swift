//
//  StegoEncodingController.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 14/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol StegoEncodingPresentable: BasePresentable {
    func displayStegoEncoding()
}

final class StegoEncodingController: BaseViewController {

    private let interactor: StegoEncodingInteractor

    @IBOutlet private var appHeader: AppHeaderView!
    @IBOutlet private var appHeaderLabel: UILabel!
    @IBOutlet private var bottomPickerButton: RoundedPickingButtonView!
    @IBOutlet private var cameraPickerButton: RoundedPickingButtonView!

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

    func displayStegoEncoding() {
        setupTranslations()
        setupView()
    }
}

private extension StegoEncodingController {

    private func setupTranslations() {
        appHeader.setup(title: Strings.Steganography.Encoding.title, isBack: true)
        appHeaderLabel.attributedText = NSMutableAttributedString()
            .bold(Strings.Steganography.Encoding.headerText1)
            .mainGreenHighlightBold(Strings.Steganography.Encoding.headerText2)
            .bold(Strings.Steganography.Encoding.headerText3)

        let bottomPickerString = NSMutableAttributedString()
            .normalGrey(Strings.Steganography.Encoding.bottomPickerButton1)
            .mainGreenHighlightRegular(Strings.Steganography.Encoding.bottomPickerButton2)
            .normalGrey(Strings.Steganography.Encoding.bottomPickerButton3)
            .mainGreenHighlightRegular(Strings.Steganography.Encoding.bottomPickerButton4)
        bottomPickerButton.setTitleWithAttributed(bottomPickerString)

        let cameraPickerString = NSMutableAttributedString()
            .normalGrey(Strings.Steganography.Encoding.camerPickerButton1)
            .mainGreenHighlightRegular(Strings.Steganography.Encoding.camerPickerButton2)
        cameraPickerButton.setTitleWithAttributed(cameraPickerString)
    }

    private func setupView() {
        setupHeader()
    }

    private func setupHeader() {
        appHeader.backAction = { [weak self] in
            self?.interactor.goBack()
        }
    }
    
    private func setupPickingButtons() {
        bottomPickerButton.pickAction = { [weak self] in
            
        }
    }
}
