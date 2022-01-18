//
//  StegoInformationPresenter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol StegoInformationPresenter: BasePresenter {
    // TODO: Fill this with public interactor methods
    func presentStegoInformation()
}

final class StegoInformationPresenterImpl<T: StegoInformationPresentable>: BasePresenterImpl<T> { }

extension StegoInformationPresenterImpl: StegoInformationPresenter {

    // TODO: Fill this with public interactor methods
    func presentStegoInformation() {
        controller?.displayStegoInformation()
    }
}

private extension StegoInformationPresenterImpl {
    // TODO: Fill this with private interactor methods
}
