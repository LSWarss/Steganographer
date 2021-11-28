//
//  SteganographyTwoViewController.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 16/11/2021.
//

import UIKit
import Photos
import PhotosUI

protocol SteganographyDashboardView {

    var presenter: DashboardPresenter? { get set }

    func filterCards(with text: String)
}

final class DashboardViewController: UIViewController {

    var presenter: DashboardPresenter?

    var categories = ["Steganography"]
    var cardsTitles = ["Encode", "Decode", "Info", "History"]

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
        tableView.register(CardsRowCell.self, forCellReuseIdentifier: "collectionViewCell")
        tableView.register(SearchBarCell.self, forCellReuseIdentifier: "searchBarCell")
    }

    func setupLayout() {
        tableView.delegate = self
        tableView.dataSource = self

        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "header", for: indexPath) as? StegoHeaderCell
            cell?.selectionStyle = .none
            cell?.welcomeMessageLabel.attributedText = NSMutableAttributedString()
                .mainGreenHighlightBold("Hello Łukasz,\n")
                .bold("are there anything we can help you with?")

            guard let cell = cell else { return UITableViewCell() }

            return cell

        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "searchBarCell", for: indexPath) as? SearchBarCell
            cell?.selectionStyle = .none
            guard let cell = cell else { return UITableViewCell() }

            return cell

        } else if indexPath.row == 2 {
            let collectionViewCell = tableView.dequeueReusableCell(withIdentifier: "collectionViewCell",
                                                                   for: indexPath) as? CardsRowCell
            collectionViewCell?.selectionStyle = .none
            collectionViewCell?.presenter = presenter
            collectionViewCell?.cardsTitles = cardsTitles
            collectionViewCell?.cardsImages = [UIImage(named: "hide"), UIImage(named: "find"),
                                               UIImage(named: "info"), UIImage(named: "history")]

            guard let collectionViewCell = collectionViewCell else { return UITableViewCell() }

            return collectionViewCell
        }

        let cell = UITableViewCell()
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       // Make the first row larger to accommodate a custom cell.
      if indexPath.row == 1 {
          return 50
      } else if indexPath.row == 2 {
          return 150
      }

       // Use the default size for all other rows.
       return UITableView.automaticDimension
    }

}

extension DashboardViewController: SteganographyDashboardView {

    func filterCards(with text: String) {
        cardsTitles = self.cardsTitles.filter({$0.contains(text)})
        self.tableView.reloadData()
    }
}
