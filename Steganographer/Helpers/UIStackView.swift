//
//  UIStackView.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 11/12/2021.
//

import Foundation
import UIKit

extension UIStackView {

    func removeAllSubviews() {
        self.arrangedSubviews.forEach {
            self.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
}
