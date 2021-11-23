//
//  SteganographyDashboardViewController.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 04/11/2021.
//

// import UIKit
// import Photos
// import PhotosUI
//
// protocol SteganographyDashboardView {
//
//    var presenter: StegoPresenter? { get set }
//
//    func updateImage(with image: UIImage, and url: URL)
//    func updateImage(with error: String)
//    func updateText(with text: String)
//    func showSpinner()
//    func dismissSpinner()
// }
//
// final class SteganographyDashboardViewController: UIViewController, SteganographyDashboardView {
//
//    lazy var containerView: UIView = {
//        let container = UIView()
//        container.translatesAutoresizingMaskIntoConstraints = false
//        container.backgroundColor = .white
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard(_:)))
//        container.addGestureRecognizer(tapGesture)
//        return container
//    }()
//
//    lazy var tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.backgroundColor = .white
//        return tableView
//    }()
//
//    lazy var titleLabel: UILabel = {
//        let titleLabel = UILabel()
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        titleLabel.text = "Steganographer"
//        titleLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
//        titleLabel.textColor = .black
//        titleLabel.textAlignment = .center
//        return titleLabel
//    }()
//
//    lazy var descriptionLabel: UILabel = {
//        let descriptionLabel = UILabel()
//        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
//        descriptionLabel.textColor = .gray
//        descriptionLabel.text = "Press below to choose your image 🌃"
//        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
//        descriptionLabel.textAlignment = .center
//        return descriptionLabel
//    }()
//
//    lazy var imageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.image = UIImage(named: "mona")
//        imageView.isUserInteractionEnabled = true
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectImage(_:)))
//        imageView.contentMode = .scaleToFill
//        imageView.addGestureRecognizer(tapGesture)
//        return imageView
//    }()
//
//    lazy var loadingView: UIView = {
//        let loadingView = UIView()
//        loadingView.translatesAutoresizingMaskIntoConstraints = false
//        loadingView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
//        loadingView.isHidden = true
//        return loadingView
//    }()
//
//    lazy var loadingSpinner: UIActivityIndicatorView = {
//        let spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
//        spinner.color = UIColor.white
//        spinner.translatesAutoresizingMaskIntoConstraints = false
//        spinner.color = .white
//        return spinner
//    }()
//
//    lazy var messageInput: UITextView = {
//        let textView = UITextView()
//        textView.translatesAutoresizingMaskIntoConstraints = false
//        textView.layer.cornerRadius = 10
//        textView.layer.borderWidth = 3
//        textView.layer.borderColor = UIColor.gray.cgColor
//        textView.keyboardDismissMode = .interactive
//        return textView
//    }()
//
//    lazy var encodingButton: RoundedButton = {
//        let button = RoundedButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.selectedText = "Encode"
//        button.setAccessibiltyWithIdentifier(with: "encodeButton")
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleEncode(_:)))
//        button.addGestureRecognizer(tapGesture)
//        return button
//    }()
//
//    lazy var decodingButton: UIButton = {
//        let button = RoundedButton()
//        button.selectedText = "Decode"
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setAccessibiltyWithIdentifier(with: "decodeButton")
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDecode(_:)))
//        button.addGestureRecognizer(tapGesture)
//        return button
//    }()
//
//    var presenter: StegoPresenter?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupView()
//        setupLoadingView()
//    }
//
//    private func setupView() {
//        // MARK: - View Container setup -
//        view.addSubview(containerView)
//        containerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//
//        containerView.addSubview(imageView)
//        containerView.addSubview(titleLabel)
//        containerView.addSubview(descriptionLabel)
//        containerView.addSubview(messageInput)
//        containerView.addSubview(encodingButton)
//        containerView.addSubview(decodingButton)
//
//        imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
//        imageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -100).isActive = true
//        imageView.heightAnchor.constraint(lessThanOrEqualTo: containerView.heightAnchor,
//                                          multiplier: 0.4).isActive = true
//        imageView.widthAnchor.constraint(lessThanOrEqualTo: containerView.widthAnchor,
//                                         multiplier: 0.6).isActive = true
//
//        descriptionLabel.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -16).isActive = true
//        descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
//        descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
//
//        titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -16).isActive = true
//        titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
//        titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
//
//        messageInput.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16).isActive = true
//        messageInput.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
//        messageInput.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.7).isActive = true
//        messageInput.heightAnchor.constraint(lessThanOrEqualTo: containerView.heightAnchor,
//                                             multiplier: 0.2).isActive = true
//
//        encodingButton.topAnchor.constraint(equalTo: messageInput.bottomAnchor, constant: 8).isActive = true
//        encodingButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
//        encodingButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
//
//        decodingButton.topAnchor.constraint(equalTo: encodingButton.bottomAnchor, constant: 8).isActive = true
//        decodingButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
//        decodingButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
//    }
//
//    private func setupLoadingView() {
//        // MARK: Loading View setup -
//        view.addSubview(loadingView)
//        loadingView.addSubview(loadingSpinner)
//        loadingView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//
//        loadingSpinner.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor).isActive = true
//        loadingSpinner.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor).isActive = true
//        loadingSpinner.heightAnchor.constraint(equalToConstant: 32).isActive = true
//        loadingSpinner.widthAnchor.constraint(equalToConstant: 32).isActive = true
//    }
//
//    func updateImage(with image: UIImage, and url: URL) {
//        DispatchQueue.main.async {
//            self.imageView.image = image
//            self.imageView.layer.borderColor = UIColor.purple.cgColor
//            self.imageView.layer.borderWidth = 3
//
//            let activityView = UIActivityViewController(activityItems: [url], applicationActivities: nil)
//            self.present(activityView, animated: true)
//        }
//
//    }
//
//    func updateImage(with error: String) {
//        self.showAlert(title: "Error", msg: error)
//    }
//
//    func updateText(with text: String) {
//        self.showAlert(title: "Decoded message", msg: text)
//    }
//
//    func showSpinner() {
//        self.loadingSpinner.startAnimating()
//        self.loadingView.isHidden = false
//    }
//
//    func dismissSpinner() {
//        self.loadingSpinner.stopAnimating()
//        self.loadingView.isHidden = true
//    }
//
// }
//
// MARK: Tap etc. actions
// extension SteganographyDashboardViewController {
//
//    @objc func selectImage(_ sender: UITapGestureRecognizer) {
//
//        PHPhotoLibrary.requestAuthorization(for: .readWrite) { [weak self] _ in
//            DispatchQueue.main.async {
//                self?.showPhotoLibrary()
//            }
//        }
//    }
//
//    private func showPhotoLibrary() {
//        var config = PHPickerConfiguration(photoLibrary: .shared())
//        config.selectionLimit = 1
//        config.filter = .images
//        let viewController = PHPickerViewController(configuration: config)
//        viewController.delegate = self
//        present(viewController, animated: true)
//    }
//
//    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
//        self.view.endEditing(true)
//    }
//
//    @objc func handleEncode(_ sender: UITapGestureRecognizer) {
//        if !messageInput.text.isEmpty {
//            guard let image = imageView.image else { return }
//
//            presenter?.interactor?.encodeWithText(with: messageInput.text, in: image)
//        } else {
//            self.showAlert(title: "Empty message", msg: "Type in your message in :)")
//        }
//
//    }
//
//    @objc func handleDecode(_ sender: UITapGestureRecognizer) {
//        guard let image = imageView.image else {
//            return
//        }
//
//        presenter?.interactor?.decodeFromImage(from: image)
//    }
//
// }
//
// MARK: PHPickerDelegate
// extension SteganographyDashboardViewController: PHPickerViewControllerDelegate {
//
//    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
//        picker.dismiss(animated: true) {
//            print("dismissed")
//        }
//
//        results.forEach { result in
//            result.itemProvider.loadObject(ofClass: UIImage.self) { reading, error in
//
//                guard let image = reading as? UIImage, error == nil else {
//                    return
//                }
//
//                DispatchQueue.main.async {
//                    self.imageView.image = image
//                    self.imageView.layer.borderColor = UIColor.green.cgColor
//                    self.imageView.layer.borderWidth = 3
//                }
//            }
//        }
//    }
// }
