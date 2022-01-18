//
//  StegoEncodingChosenController.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/01/2022.
//  Copyright (c) 2022. All rights reserved.

import UIKit

private typealias Page = Strings.Steganography.Encoding.Chosen

protocol StegoEncodingChosenPresentable: BasePresentable {
    func displayStegoEncodingChosen(with image: UIImage)
    func displayImageSaving(for url: URL)
}

final class StegoEncodingChosenController: BaseViewController {

    private let interactor: StegoEncodingChosenInteractor

    @IBOutlet private var appHeaderLabel: UILabel!
    @IBOutlet private var appHeader: AppHeaderView!
    @IBOutlet private var encryptionImageView: UIImageView!
    @IBOutlet private var textViewTitleLabel: UILabel!
    @IBOutlet private var encryptionMessageTextView: UITextView!
    @IBOutlet private var submitButton: UIButton!
    
    init(interactor: StegoEncodingChosenInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        interactor.getStegoEncodingChosen()
    }
}

extension StegoEncodingChosenController: StegoEncodingChosenPresentable {

    func displayStegoEncodingChosen(with image: UIImage) {
        self.encryptionImageView.image = image
    }
    
    func displayImageSaving(for url: URL) {
        let activityView = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        self.present(activityView, animated: true)
        self.interactor.goToDashboard()
    }
}

extension StegoEncodingChosenController: UITextViewDelegate {
    
}

private extension StegoEncodingChosenController {

    private func setupTranslations() {
        appHeader.setup(in: self, title: "")
        appHeaderLabel.attributedText = NSMutableAttributedString()
            .bold(Page.headerText1)
            .mainGreenHighlightBold(Page.headerText2)
            .bold(Page.headerText3)
        textViewTitleLabel.text = Page.TextView.title
        
    }

    private func setupView() {
        setupTranslations()
        setupImageView()
        setupTextView()
        setupSubmitButton()
    }
    
    private func setupImageView() {
        encryptionImageView.layer.cornerRadius = 15
        encryptionImageView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        encryptionImageView.layer.shadowOpacity = 1
        encryptionImageView.layer.shadowOffset = CGSize(width: 0, height: 4)
        encryptionImageView.layer.shadowRadius = 10
    }
    
    private func setupTextView() {
        encryptionMessageTextView.layer.cornerRadius = 15
        encryptionMessageTextView.layer.borderColor = UIColor.black.cgColor
        encryptionMessageTextView.layer.borderWidth = 1
    }
    
    private func setupSubmitButton() {
        submitButton.addTarget(self, action: #selector(submitButtonAction), for: .touchUpInside)
    }
    
    @objc func submitButtonAction() {
        self.interactor.encodeImageWithText(encryptionMessageTextView.text)
    }
}
