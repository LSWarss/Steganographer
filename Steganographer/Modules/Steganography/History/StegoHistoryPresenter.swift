//
//  StegoHistoryPresenter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 12/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol StegoHistoryPresenter: BasePresenter {
    // TODO: Fill this with public interactor methods
    func presentStegoHistory()
}

final class StegoHistoryPresenterImpl<T: StegoHistoryPresentable>: BasePresenterImpl<T> { }

extension StegoHistoryPresenterImpl: StegoHistoryPresenter {

    // TODO: Fill this with public interactor methods
    func presentStegoHistory() {
        controller?.displayStegoHistory()
    }
}

private extension StegoHistoryPresenterImpl {
    // TODO: Fill this with private interactor methods
}
