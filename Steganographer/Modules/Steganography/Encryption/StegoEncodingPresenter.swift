//
//  StegoEncodingPresenter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 14/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol StegoEncodingPresenter: BasePresenter {
    // TODO: Fill this with public interactor methods
    func presentStegoEncoding()
}

final class StegoEncodingPresenterImpl<T: StegoEncodingPresentable>: BasePresenterImpl<T> { }

extension StegoEncodingPresenterImpl: StegoEncodingPresenter {

    // TODO: Fill this with public interactor methods
    func presentStegoEncoding() {
        controller?.displayStegoEncoding()
    }
}

private extension StegoEncodingPresenterImpl {
    // TODO: Fill this with private interactor methods
}
