//
//  BottomPickerViewController.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 28/11/2021.
//

import Foundation
import UIKit

class BottomPickerViewController: UIViewController {

    lazy var filesButton: CardView = {
        let label = CardView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .mainGreen
        label.cardImageView.image = UIImage(systemName: "doc")
        label.cardTitleLabel.text = "Files"
        return label
    }()

    lazy var photosButton: CardView = {
        let label = CardView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .mainGreen
        label.cardImageView.image = UIImage(systemName: "photo")
        label.cardTitleLabel.text = "Photos"
        return label
    }()

    lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

    private func setupLayout() {
        view.addSubview(backgroundView)
        backgroundView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        backgroundView.addSubview(photosButton)
        backgroundView.addSubview(filesButton)

        photosButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -84).isActive = true
        photosButton.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 32).isActive = true

        filesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 84).isActive = true
        filesButton.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 32).isActive = true
    }

}
