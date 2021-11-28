//
//  MessageTextFieldCell.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 27/11/2021.
//

import UIKit

final class MessageTextFieldCell: UITableViewCell {

    private let reuseableCell = "roundedButtonCell"

    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

    lazy var textField: UITextView = {
        let tfview = UITextView()
        tfview.backgroundColor = .white
        tfview.layer.cornerRadius = 15
        tfview.layer.borderWidth = 1
        tfview.layer.borderColor = UIColor.defaultGreyColor?.cgColor
        tfview.translatesAutoresizingMaskIntoConstraints = false
        return tfview
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseableCell)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        self.contentView.addSubview(label)
        self.contentView.addSubview(textField)

        label.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        label.heightAnchor.constraint(equalToConstant: 24).isActive = true

        textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 12).isActive = true
        textField.leadingAnchor.constraint(equalTo: label.leadingAnchor).isActive = true
        textField.trailingAnchor.constraint(equalTo: label.trailingAnchor).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 160).isActive = true
    }
}
