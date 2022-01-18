//
//  StegoDecodingController.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

private typealias Page = Strings.Steganography.Decoding

protocol StegoDecodingPresentable: BasePresentable {}

final class StegoDecodingController: BaseViewController {

    private let interactor: StegoDecodingInteractor

    @IBOutlet private var appHeader: AppHeaderView!
    @IBOutlet private var appTitleLabel: UILabel!
    @IBOutlet private var photosButton: RoundedPickingButtonView!
    @IBOutlet private var filesButton: RoundedPickingButtonView!
    
    var imagePicker: ImagePicker?
    var documentPicker: FilesImagePicker?
    
    init(interactor: StegoDecodingInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        displayStegoDecoding()
    }
}

extension StegoDecodingController: StegoDecodingPresentable {

    func displayStegoDecoding() {
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        self.documentPicker = FilesImagePicker(presentationController: self, delegate: self)
        
        setupTranslations()
        setupPickingButtons()
    }
}

private extension StegoDecodingController {

    private func setupTranslations() {
        appHeader.setup(in: self, title: Page.title)
        
        appTitleLabel.attributedText = NSMutableAttributedString()
            .bold(Page.headerText1)
            .mainGreenHighlightBold(Page.headerText2)
            .bold(Page.headerText3)

        let photosPickingString = NSMutableAttributedString()
            .normalGrey(Page.bottomPickerButton1)
            .mainGreenHighlightRegular(Page.bottomPickerButton2)
        photosButton.setTitleWithAttributed(photosPickingString)

        let filesPickingString = NSMutableAttributedString()
            .normalGrey(Page.filesPickerButton1)
            .mainGreenHighlightRegular(Page.filesPickerButton2)
        filesButton.setTitleWithAttributed(filesPickingString)
    }
    
    private func setupPickingButtons() {

        photosButton.pickAction = { [weak self] in
            self?.imagePicker?.present(from: (self?.photosButton)!)
        }

        filesButton.pickAction = { [weak self] in
            self?.documentPicker?.present(from: (self?.filesButton)!)
        }
    }
}

extension StegoDecodingController: ImagePickerDelegate {
    
    func didSelect(image: UIImage?) {
        guard let image = image else {
            return
        }
        
        self.interactor.goToStegoDecodingWithImage(image)
    }
}

extension StegoDecodingController: FilesImagePickerDelegate {
    
    func didSelect(documentOnURL: URL?) {
        guard let documentOnURL = documentOnURL else {
            return
        }
        
        if let data = try? Data(contentsOf: documentOnURL) {
            guard let image = UIImage(data: data) else {
                return
            }
            
            self.interactor.goToStegoDecodingWithImage(image)
        }
    }
}
