//
//  CardCell.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 18/11/2021.
//

import UIKit

final class CardCell: UICollectionViewCell {

    lazy var backgroundImage: UIImageView = {
        let imageV = UIImageView()
        imageV.translatesAutoresizingMaskIntoConstraints = false
        imageV.contentMode = .scaleAspectFill
        imageV.clipsToBounds = true
        imageV.image = UIImage(named: "mona")
        imageV.layer.cornerRadius = 15
        imageV.backgroundColor = .white
        return imageV
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowRadius = 3
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        self.contentView.addSubview(backgroundImage)

        backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        backgroundImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

    }

}
