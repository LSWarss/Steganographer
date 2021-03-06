//
//  StegoEncodingController.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 14/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol StegoEncodingPresentable: BasePresentable {
}

final class StegoEncodingController: BaseViewController {

    private let interactor: StegoEncodingInteractor

    @IBOutlet private var appHeader: AppHeaderView!
    @IBOutlet private var appHeaderLabel: UILabel!
    @IBOutlet private var bottomPickerButton: RoundedPickingButtonView!
    @IBOutlet private var cameraPickerButton: RoundedPickingButtonView!

    var imagePicker: ImagePicker?
    var documentPicker: FilesImagePicker?

    init(interactor: StegoEncodingInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        displayStegoEncoding()
    }
}

extension StegoEncodingController: StegoEncodingPresentable {

    func displayStegoEncoding() {
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        self.documentPicker = FilesImagePicker(presentationController: self, delegate: self)
        
        setupTranslations()
        setupView()
    }
}

private extension StegoEncodingController {

    private func setupTranslations() {
        appHeader.setup(in: self, title: Strings.Steganography.Encoding.title)

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
        setupPickingButtons()
    }

    private func setupPickingButtons() {

        bottomPickerButton.pickAction = { [weak self] in
            self?.imagePicker?.present(from: (self?.bottomPickerButton)!)
        }

        cameraPickerButton.pickAction = { [weak self] in
            self?.documentPicker?.present(from: (self?.cameraPickerButton)!)
        }
    }
}

extension StegoEncodingController: ImagePickerDelegate {

    func didSelect(image: UIImage?) {
        guard let image = image else {
            return
        }

        interactor.goToStegoEncodingWithImage(image)
    }
}

extension StegoEncodingController: FilesImagePickerDelegate {

    func didSelect(documentOnURL: URL?) {
        guard let documentOnURL = documentOnURL else {
            return
        }
        
        if let data = try? Data(contentsOf: documentOnURL) {
            guard let image = UIImage(data: data) else {
                return
            }
            interactor.goToStegoEncodingWithImage(image)
        }
    }
}
