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

extension UIView {

    func pinToView(_ view: UIView, offset: CGFloat = 0.0, safeArea: Bool = false) {
        let edgeInsets = UIEdgeInsets(top: offset, left: offset, bottom: offset, right: offset)
        pinToView(view: view, edgeInsets: edgeInsets, safeArea: safeArea)
    }

    func pinToView(view: UIView, edgeInsets: UIEdgeInsets = .zero, safeArea: Bool = false) {
        let safeArea: UILayoutGuide? = safeArea ? view.safeAreaLayoutGuide : nil
        translatesAutoresizingMaskIntoConstraints = false
        if let safeArea = safeArea {
            NSLayoutConstraint.activate([
                leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: edgeInsets.left),
                trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -edgeInsets.right),
                topAnchor.constraint(equalTo: safeArea.topAnchor, constant: edgeInsets.top),
                bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -edgeInsets.bottom)
            ])
        } else {
            NSLayoutConstraint.activate([
                leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: edgeInsets.left),
                trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -edgeInsets.right),
                topAnchor.constraint(equalTo: view.topAnchor, constant: edgeInsets.top),
                bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -edgeInsets.bottom)
            ])
        }
    }

}
