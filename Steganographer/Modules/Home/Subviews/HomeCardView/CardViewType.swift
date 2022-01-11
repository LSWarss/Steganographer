//
//  CardViewType.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 11/12/2021.
//

import UIKit

enum CardViewType: Equatable {

    case encoding
    case decoding
    case information
    case history

    var title: String {
        switch self {
        case .encoding:
            return Strings.CardViewType.Title.encoding
        case .decoding:
            return Strings.CardViewType.Title.decoding
        case .information:
            return Strings.CardViewType.Title.information
        case .history:
            return Strings.CardViewType.Title.history
        }
    }

    var image: UIImage {
        switch self {
        case .encoding:
            return Asset.Assets.hide.image
        case .decoding:
            return Asset.Assets.find.image
        case .information:
            return Asset.Assets.info.image
        case .history:
            return Asset.Assets.history.image
        }

    }

}
