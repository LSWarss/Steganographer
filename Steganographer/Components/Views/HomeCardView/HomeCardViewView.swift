//
//  HomeCardViewView.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 11/12/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates by Patryk Średziński
//

import UIKit

final class HomeCardViewView: XibView {

    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var backgroundImage: UIImageView!
    private var type: CardViewType = .encoding

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

}

private extension HomeCardViewView {

    private func setupView() {
        // TODO: Implement custom view setup here or remove this method
    }
}
