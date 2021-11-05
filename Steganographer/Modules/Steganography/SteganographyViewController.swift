//
//  SteganographyViewController.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 04/11/2021.
//

import Foundation
import UIKit

protocol AnyView {

    var presenter: AnyPresenter? { get set }

    func updateImage(with image: UIImage)
    func updateImage(with error: String)
    func updateText(with text: String)
}

final class SteganographyViewController: UIViewController, AnyView {

    var presenter: AnyPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func updateImage(with image: UIImage) {

    }

    func updateImage(with error: String) {

    }

    func updateText(with text: String) {

    }

}
