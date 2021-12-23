//
//  StegoEncodingRouter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 14/12/2021.
//  Copyright (c) 2021. All rights reserved.

import UIKit

protocol StegoEncodingRouter {
}

final class StegoEncodingRouterImpl {
    weak var controller: UIViewController?
}

extension StegoEncodingRouterImpl: StegoEncodingRouter {}

private extension StegoEncodingRouterImpl {}
