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

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        tableView.register(StegoHeaderCell.self, forCellReuseIdentifier: "header")
        tableView.register(RoundedButtonCell.self, forCellReuseIdentifier: "roundedButton")
    }

    private func setupLayout() {
        tableView.delegate = self
        tableView.dataSource = self

        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    func updateImage(with image: UIImage, and url: URL) {

    }

    func updateImage(with error: String) {

    }

    func updateText(with text: String) {

    }

}

extension SteganographyEncodingViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "header", for: indexPath) as? StegoHeaderCell

            cell?.welcomeMessageLabel.attributedText = NSMutableAttributedString()
                .bold("Here you can ")
                .mainGreenHighlightBold("hide ")
                .bold("your message in\nthe image, right from your photos\nlibrary or camera :)")

            guard let cell = cell else { return UITableViewCell() }

            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "roundedButton",
                                                     for: indexPath) as? RoundedButtonCell

            cell?.label.attributedText = NSMutableAttributedString()
                .normalGrey("Click here to pick an image from\n")
                .mainGreenHighlightRegular("Photos")
                .normalGrey(" or ")
                .mainGreenHighlightRegular("Files")

            guard let cell = cell else { return UITableViewCell() }

            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "roundedButton",
                                                     for: indexPath) as? RoundedButtonCell

            cell?.label.attributedText = NSMutableAttributedString()
                .normalGrey("Click here to make a photo with\n")
                .mainGreenHighlightRegular("Camera")

            guard let cell = cell else { return UITableViewCell() }

            return cell
        default:
            let cell = UITableViewCell()
            return cell
        }

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       // Make the first row larger to accommodate a custom cell.
        switch indexPath.row {
        case 1:
            return 80
        case 2:
            return 80
        default:
            return UITableView.automaticDimension
        }

    }

}
