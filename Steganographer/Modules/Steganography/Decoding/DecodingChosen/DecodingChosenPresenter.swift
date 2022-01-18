//
//  DecodingChosenPresenter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 18/01/2022.
//  Copyright (c) 2022. All rights reserved.

import UIKit

protocol DecodingChosenPresenter: BasePresenter {
    func presentDecodedMessage(_ message: String)
}

final class DecodingChosenPresenterImpl<T: DecodingChosenPresentable>: BasePresenterImpl<T> { }

extension DecodingChosenPresenterImpl: DecodingChosenPresenter {
    
    func presentDecodedMessage(_ message: String) {
        controller?.displayDecodedMessage(message)
    }
}
