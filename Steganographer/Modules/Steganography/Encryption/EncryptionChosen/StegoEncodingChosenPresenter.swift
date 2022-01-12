//
//  StegoEncodingChosenPresenter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/01/2022.
//  Copyright (c) 2022. All rights reserved.

import UIKit

protocol StegoEncodingChosenPresenter: BasePresenter {
    func presentStegoEncodingChosen(with image: UIImage)
}

final class StegoEncodingChosenPresenterImpl<T: StegoEncodingChosenPresentable>: BasePresenterImpl<T> { }

extension StegoEncodingChosenPresenterImpl: StegoEncodingChosenPresenter {

    func presentStegoEncodingChosen(with image: UIImage) {
        controller?.displayStegoEncodingChosen(with: image)
    }
}

private extension StegoEncodingChosenPresenterImpl {}
