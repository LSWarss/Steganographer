//
//  SteganographyTwoViewController.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 16/11/2021.
//

import UIKit
import Photos
import PhotosUI

protocol SteganographyView {

    var presenter: StegoPresenter? { get set }

    func updateImage(with image: UIImage, and url: URL)
    func updateImage(with error: String)
    func updateText(with text: String)
    func showSpinner()
    func dismissSpinner()
}

final class SteganographyViewController: UIViewController {

    var presenter: StegoPresenter?

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false

        tableView.separatorStyle = .none
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        tableView.register(StegoHeaderCell.self, forCellReuseIdentifier: "header")
    }

    func setupView() {
        tableView.delegate = self
        tableView.dataSource = self

        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

}

extension SteganographyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "header", for: indexPath) as? StegoHeaderCell

        cell?.welcomeMessageLabel.attributedText = NSMutableAttributedString()
            .mainGreenHighlight("Hello Łukasz,\n")
            .bold("are there anything we can help you with?")

        return cell!
    }

}

extension SteganographyViewController: SteganographyView {

    func updateImage(with image: UIImage, and url: URL) {

    }

    func updateImage(with error: String) {

    }

    func updateText(with text: String) {

    }

    func showSpinner() {

    }

    func dismissSpinner() {

    }

}
