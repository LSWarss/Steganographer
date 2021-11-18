//
//  HeaderCell.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 16/11/2021.
//

import UIKit

final class StegoHeaderCell: UITableViewCell {

    lazy var welcomeMessageLabel: UILabel  = {
       let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        addSubview(welcomeMessageLabel)

        welcomeMessageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        welcomeMessageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        welcomeMessageLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        welcomeMessageLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        welcomeMessageLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

    }

}
