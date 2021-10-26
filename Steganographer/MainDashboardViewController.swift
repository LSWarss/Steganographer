//
//  ViewController.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 18/10/2021.
//

import UIKit

final class MainDashboardViewController: UIViewController {

    lazy var headerView: UIView = {
        let headerView = UIView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()

    lazy var headerTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Steganographer"
        title.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        return title
    }()

    lazy var infoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(systemName: "info.circle.fill"), for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(onInfoPress), for: .touchUpInside)
        return button
    }()

    lazy var bodyContainer: UIView = {
        let bodyView = UIView()
        bodyView.translatesAutoresizingMaskIntoConstraints = false
        return bodyView
    }()

    lazy var encodeButton: UIButton = {
        let button = RoundedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.selectedText = "Encode"
        button.addTarget(self, action: #selector(onEncodePress), for: .touchUpInside)
        return button
    }()

    lazy var decodeButton: UIButton = {
        let button = RoundedButton()
        button.selectedText = "Decode"
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(onDecodePress), for: .touchUpInside)
        button.setAccessibiltyWithIdentifier("decodeButton")
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

    @objc func onEncodePress() {
        print("Encode Button Pressed from Main")
        let encodingViewController = EncodingViewController()

        self.navigationController?.pushViewController(encodingViewController, animated: true)
    }

    @objc func onDecodePress() {
        print("Decode Button Pressed from Main")
        let decodingViewController = DecodingViewController()

        self.navigationController?.pushViewController(decodingViewController, animated: true)
    }

    @objc func onInfoPress() {
        print("Info Button Pressed from Main")
    }

    /// Simple function for setting up constraints, anchors etc.
    private func setupLayout() {

        // MARK: Header initalization
        view.addSubview(headerView)
        headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true

        headerView.addSubview(headerTitle)
        headerView.addSubview(infoButton)

        infoButton.centerYAnchor.constraint(equalTo: headerTitle.centerYAnchor).isActive = true
        infoButton.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 32).isActive = true
        infoButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        infoButton.widthAnchor.constraint(equalToConstant: 32).isActive = true

        headerTitle.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 16).isActive = true
        headerTitle.leftAnchor.constraint(equalTo: infoButton.rightAnchor, constant: 16).isActive = true

        // MARK: Main UI initalization
        view.addSubview(bodyContainer)

        bodyContainer.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 16).isActive = true
        bodyContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bodyContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bodyContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7).isActive = true

        bodyContainer.addSubview(encodeButton)
        bodyContainer.addSubview(decodeButton)

        encodeButton.centerXAnchor.constraint(equalTo: bodyContainer.centerXAnchor).isActive = true
        encodeButton.topAnchor.constraint(equalTo: bodyContainer.topAnchor, constant: 32).isActive = true
        encodeButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        decodeButton.topAnchor.constraint(equalTo: encodeButton.bottomAnchor, constant: 16).isActive = true
        decodeButton.centerXAnchor.constraint(equalTo: bodyContainer.centerXAnchor).isActive = true
        decodeButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }

}
