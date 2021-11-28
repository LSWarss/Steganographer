//
//  CardView.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 28/11/2021.
//

import UIKit

final class CardView: UIView {

    lazy var cardTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()

    lazy var cardImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .white
        image.image = UIImage(systemName: "doc")
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        self.backgroundColor = .mainGreen
        self.layer.cornerRadius = 15
        self.heightAnchor.constraint(equalToConstant: 90).isActive = true
        self.widthAnchor.constraint(equalToConstant: 90).isActive = true

        self.addSubview(cardTitleLabel)
        self.addSubview(cardImageView)

        cardImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cardImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -8).isActive = true
        cardImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        cardImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true

        cardTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        cardTitleLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    }

}
