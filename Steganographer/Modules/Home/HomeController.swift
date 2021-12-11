//
//  HomeController.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 11/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol HomePresentable: BasePresentable {
    // TODO: Fill this with view setup methods
    func displayHome()
}

final class HomeController: BaseViewController {

    private let interactor: HomeInteractor

    @IBOutlet private var rowVStackView: UIStackView!
    @IBOutlet private var rowLabel: UILabel!
    @IBOutlet private var rowHStackView: UIStackView!
    @IBOutlet private var headerMessageLabel: UILabel!

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

    // TODO: Fill this with view setup methods
    func displayHome() {
        setupTranslations()
        setupView()
    }
}

private extension HomeController {

    private func setupTranslations() {
        headerMessageLabel.attributedText = NSMutableAttributedString()
            .mainGreenHighlightBold("Hello Łukasz,\n")
            .bold("are there anything we can help you with?")
    }

    private func setupView() {
        // TODO: Setup view here
    }
}
