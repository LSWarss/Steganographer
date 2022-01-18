//
//  DecodingChosenController.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 18/01/2022.
//  Copyright (c) 2022. All rights reserved.

import UIKit

private typealias Page = Strings.Steganography.Decoding.Chosen

protocol DecodingChosenPresentable: BasePresentable {
    func displayDecodedMessage(_ message: String)
}

final class DecodingChosenController: BaseViewController {

    private let interactor: DecodingChosenInteractor

    @IBOutlet private var appHeader: AppHeaderView!
    @IBOutlet private var appHeaderLabel: UILabel!
    @IBOutlet private var backgroundView: UIView!
    @IBOutlet private var messageLabel: UILabel!
    @IBOutlet private var shareButton: UIButton!
    @IBOutlet private var backButton: UIButton!
    
    init(interactor: DecodingChosenInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTranslations()
        setupView()
        interactor.getStegoDecodingChosen()
    }
}

extension DecodingChosenController: DecodingChosenPresentable {
    
    func displayDecodedMessage(_ message: String) {
        messageLabel.text = message
    }

}

private extension DecodingChosenController {

    private func setupTranslations() {
        appHeader.setup(in: self, title: "")
        appHeaderLabel.attributedText = NSMutableAttributedString()
            .bold(Page.headerText1)
            .mainGreenHighlightBold(Page.headerText2)
            .bold(Page.headerText3)
        
        shareButton.setTitle(Page.SharButton.title, for: .normal)
        backButton.setTitle(Page.GoBackButton.title, for: .normal)
    }

    private func setupView() {
        setupBackgroundView()
        setupButtons()
    }
    
    func displayShare() {
        guard let message = messageLabel.text else { return }
        
        let activityView = UIActivityViewController(activityItems: [message], applicationActivities: nil)
        self.present(activityView, animated: true)
    }
    
    private func setupBackgroundView() {
        backgroundView.layer.cornerRadius = 15
        backgroundView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        backgroundView.layer.shadowOpacity = 1
        backgroundView.layer.shadowOffset = CGSize(width: 0, height: 4)
        backgroundView.layer.shadowRadius = 10
    }
    
    private func setupButtons() {
        backButton.addTarget(self, action: #selector(goBackButtonAction), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(shareButtonAction), for: .touchUpInside)
    }
    
    @objc func shareButtonAction() {
        displayShare()
    }
    
    @objc func goBackButtonAction() {
        interactor.goBackToDashboard()
    }
}
