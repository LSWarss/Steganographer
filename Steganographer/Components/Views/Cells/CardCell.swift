//
//  CardCell.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 18/11/2021.
//

import UIKit

final class CardCell: UICollectionViewCell {

    var cardTitle: String? {
        didSet {
            cardTitleLabel.text = cardTitle
        }
    }
    var cardImage: UIImage? {
        didSet {
            backgroundImage.image = cardImage
        }
    }

    lazy var backgroundImage: UIImageView = {
        let imageV = UIImageView()
        imageV.translatesAutoresizingMaskIntoConstraints = false
        imageV.contentMode = .scaleAspectFill
        imageV.clipsToBounds = true
        imageV.layer.cornerRadius = 15
        imageV.backgroundColor = .white
        return imageV
    }()

    lazy var cardTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowRadius = 3

        self.contentView.addSubview(backgroundImage)

        backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        backgroundImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        self.contentView.addSubview(cardTitleLabel)

        cardTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4).isActive = true
        cardTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
        cardTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

    }

}
