//
//  ViewController.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 18/10/2021.
//

import UIKit
import DisguisedSwiftly

final class MainDashboardViewController: UIViewController {

    let stego: Stego = Stego()

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

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "mona")
        return imageView
    }()

    lazy var encodeButton: UIButton = {
        let button = RoundedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.selectedText = "Encode"
        button.addTarget(self, action: #selector(self.handleTap(_:)), for: .touchUpInside)
        return button
    }()

    lazy var decodeButton: UIButton = {
        let button = RoundedButton()
        button.selectedText = "Decode"
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.handleDecode(_:)), for: .touchUpInside)
        button.setAccessibiltyWithIdentifier(with: "decodeButton")
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
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

        bodyContainer.addSubview(imageView)
        bodyContainer.addSubview(encodeButton)
        bodyContainer.addSubview(decodeButton)

        imageView.centerXAnchor.constraint(equalTo: bodyContainer.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: bodyContainer.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: bodyContainer.heightAnchor, multiplier: 0.5).isActive = true
        imageView.widthAnchor.constraint(equalTo: bodyContainer.widthAnchor, multiplier: 0.5).isActive = true

        encodeButton.centerXAnchor.constraint(equalTo: bodyContainer.centerXAnchor).isActive = true
        encodeButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32).isActive = true
        encodeButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        decodeButton.topAnchor.constraint(equalTo: encodeButton.bottomAnchor, constant: 16).isActive = true
        decodeButton.centerXAnchor.constraint(equalTo: bodyContainer.centerXAnchor).isActive = true
        decodeButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }

}

// MARK: Gesture recogniser
extension MainDashboardViewController {

    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        // swiftlint:disable line_length
        let encodeText = """
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.|
"""

        guard let image = imageView.image else {
            return
        }

        imageView.image = stego.encodeTextInImage(with: encodeText, image: image, finished: { _ in
            self.imageView.layer.borderWidth = 5
            self.imageView.layer.borderColor = UIColor.red.cgColor
            print("Encoding ended")
        })
    }

    @objc func handleDecode(_ sender: UITapGestureRecognizer) {
        guard let image = imageView.image else {
            return
        }

        let decodedText = stego.decodeTextInImage(image: image) { _ in
            print("Decoding ended")
        }

        print(decodedText)
        self.decodeButton.setTitle(decodedText, for: .normal)
    }

}
