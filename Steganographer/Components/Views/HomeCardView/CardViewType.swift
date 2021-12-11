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
            return L10n.CardViewType.Title.encoding
        case .decoding:
            return L10n.CardViewType.Title.decoding
        case .information:
            return L10n.CardViewType.Title.information
        case .history:
            return L10n.CardViewType.Title.history
        }
    }

}