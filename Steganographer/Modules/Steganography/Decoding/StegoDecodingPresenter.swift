//
//  StegoDecodingPresenter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol StegoDecodingPresenter: BasePresenter {
    func presentStegoDecoding()
}

final class StegoDecodingPresenterImpl<T: StegoDecodingPresentable>: BasePresenterImpl<T> { }

extension StegoDecodingPresenterImpl: StegoDecodingPresenter {

    func presentStegoDecoding() {
        controller?.displayStegoDecoding()
    }
}

private extension StegoDecodingPresenterImpl {
    // TODO: Fill this with private interactor methods
}
