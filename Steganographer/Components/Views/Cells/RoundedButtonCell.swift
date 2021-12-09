//
//  RoundedButtonCell.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 27/11/2021.
//

import UIKit

final class RoundedButtonCell: UITableViewCell {

    private let reuseableCell = "roundedButtonCell"

    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    lazy var background: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        view.backgroundColor = UIColor.defaultGreyColor
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseableCell)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {

        contentView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
        contentView.layer.shadowRadius = 12

        self.contentView.addSubview(background)

        background.heightAnchor.constraint(equalToConstant: 60).isActive = true
        background.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        background.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        background.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        background.addSubview(label)

        label.centerXAnchor.constraint(equalTo: background.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: background.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 24).isActive = true
        label.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -24).isActive = true

    }
}