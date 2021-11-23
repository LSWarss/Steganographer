//
//  SteganographyDecodingViewController.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 22/11/2021.
//
import UIKit

protocol SteganographyDecodingView {
    var presenter: DecodingPresenter? { get set }
}

final class SteganographyDecodingViewController: UIViewController, SteganographyDecodingView {

    var presenter: DecodingPresenter?

    lazy var label: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Decoding"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true

    }
}
