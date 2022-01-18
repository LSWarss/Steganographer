//
//  StegoEncodingPresenter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 14/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol StegoEncodingPresenter: BasePresenter {}

final class StegoEncodingPresenterImpl<T: StegoEncodingPresentable>: BasePresenterImpl<T> { }

extension StegoEncodingPresenterImpl: StegoEncodingPresenter {}
