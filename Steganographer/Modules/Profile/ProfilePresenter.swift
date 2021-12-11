//
//  ProfilePresenter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 11/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol ProfilePresenter: BasePresenter {
    // TODO: Fill this with public interactor methods
    func presentProfile()
}

final class ProfilePresenterImpl<T: ProfilePresentable>: BasePresenterImpl<T> { }

extension ProfilePresenterImpl: ProfilePresenter {

    // TODO: Fill this with public interactor methods
    func presentProfile() {
        controller?.displayProfile()
    }
}

private extension ProfilePresenterImpl {
    // TODO: Fill this with private interactor methods
}
