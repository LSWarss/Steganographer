//
//  CardsRowCell.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 18/11/2021.
//

import UIKit

class CardsRowCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    var presenter: DashboardPresenter?

    var cardsImages: [UIImage?] = []
    var cardsTitles: [String] = []

    let imagesCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()

        layout.sectionInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 90, height: 90)
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let sectionTitleLabel: UILabel = {
        let label: UILabel = UILabel()

        label.text = "Steganography"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = UIColor.mainGreen

        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let reuseableCell = "cardRowCellId"

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseableCell)

        imagesCollectionView.dataSource = self
        imagesCollectionView.delegate = self

        setupViews()
        imagesCollectionView.register(CardCell.self, forCellWithReuseIdentifier: "cardCell")
    }

    func setupViews() {

        self.contentView.addSubview(sectionTitleLabel)
        self.contentView.addSubview(imagesCollectionView)

        sectionTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        sectionTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        sectionTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24).isActive = true

        imagesCollectionView.topAnchor.constraint(equalTo: sectionTitleLabel.bottomAnchor, constant: 4).isActive = true
        imagesCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imagesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imagesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardsTitles.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as? CardCell

        myCell?.cardTitle = indexPath.row < cardsTitles.count ? cardsTitles[indexPath.row] : "Placeholder"
        myCell?.cardImage = indexPath.row < cardsImages.count ? cardsImages[indexPath.row] : UIImage(named: "mona")

        guard let cell = myCell else { return UICollectionViewCell() }

        return cell
    }

}

extension CardsRowCell {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        switch indexPath.row {
        case 0:
            presenter?.makeEncoding()
        case 1:
            presenter?.makeDecoding()
        default:
            print("Stego")
        }

    }
}
