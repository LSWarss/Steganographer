//
//  ProfileController.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 11/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol ProfilePresentable: BasePresentable {
    // TODO: Fill this with view setup methods
    func displayProfile()
}

final class ProfileController: BaseViewController {

    private let interactor: ProfileInteractor

    init(interactor: ProfileInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        displayProfile()
        interactor.getProfile()
    }
}

extension ProfileController: ProfilePresentable {

    // TODO: Fill this with view setup methods
    func displayProfile() {
        setupTranslations()
        setupView()
    }
}

private extension ProfileController {

    private func setupTranslations() {
        // TODO: Setup translations for labels here
    }

    private func setupView() {
        // TODO: Setup view here
    }
}
