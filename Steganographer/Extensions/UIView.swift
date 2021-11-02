//
//  UIView.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 02/11/2021.
//

import Foundation
import UIKit

extension UIView {

    public func setAccessibiltyWithIdentifier(with identifier: String) {
        self.isAccessibilityElement = true
        self.accessibilityIdentifier = identifier
    }
}
