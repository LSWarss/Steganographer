//
//  HomeController.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 11/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol HomePresentable: BasePresentable {
    func displayHome()
}

final class HomeController: BaseViewController {

    private let interactor: HomeInteractor

    @IBOutlet private var headerMessageLabel: UILabel!
    @IBOutlet private var steganographyRowLabel: UILabel!
    @IBOutlet private var rowHStackView: UIStackView!

    private var stegoCards: [CardViewType] = [.encoding, .decoding, .history, .information]

    init(interactor: HomeInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        displayHome()
        interactor.getHome()
    }
}

extension HomeController: HomePresentable {

    func displayHome() {
        setupTranslations()
        setupView()
    }
}

private extension HomeController {

    private func setupTranslations() {
        headerMessageLabel.attributedText = NSMutableAttributedString()
            .mainGreenHighlightBold(L10n.Home.Header.firstPart)
            .bold(L10n.Home.Header.secondPart)
        steganographyRowLabel.text = L10n.Home.Row.Steganography.title
    }

    private func setupView() {
        rowHStackView.removeAllSubviews()
        for type in stegoCards {
            setupCardForType(type)
        }
    }

    private func setupCardForType(_ type: CardViewType) {
        let view = HomeCardViewView()
        view.setup(with: type)
        view.tapAction = { [weak self] in
            self?.setupActionForType(type)
            log(.info, .unknown, "View with type: \(type.title) tapped")}
        rowHStackView.addArrangedSubview(view)
    }

    private func setupActionForType(_ type: CardViewType) {
        switch type {
        case .encoding:
            interactor.getStegoEncoding()
        case .decoding:
            interactor.getStegoDecoding()
        case .history:
            interactor.getStegoHistory()
        case .information:
            interactor.getStegoInformation()
        }
    }
}
