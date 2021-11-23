//
//  SteganographyEncodingViewController.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 22/11/2021.
//

import UIKit

protocol SteganographyEncodingView {
    var presenter: EncodingPresenter? { get set }

    func updateImage(with image: UIImage, and url: URL)
    func updateImage(with error: String)
    func updateText(with text: String)
}

final class SteganographyEncodingViewController: UIViewController, SteganographyEncodingView {

    var presenter: EncodingPresenter?

    lazy var label: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ENCODING"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true

    }

    func updateImage(with image: UIImage, and url: URL) {

    }

    func updateImage(with error: String) {

    }

    func updateText(with text: String) {

    }

}
