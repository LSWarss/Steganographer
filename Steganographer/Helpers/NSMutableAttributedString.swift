//
//  NSMutableAttributedString.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 16/11/2021.
//

import UIKit

extension NSMutableAttributedString {
    var boldFontSize: CGFloat { return 20 }
    var regularFontSize: CGFloat { return 16 }
    var boldFont: UIFont { return UIFont(name: "SFPro-Bold", size: boldFontSize)
        ?? UIFont.boldSystemFont(ofSize: boldFontSize) }
    var regularFont: UIFont { return UIFont(name: "SFPro-Regular", size: regularFontSize)
        ?? UIFont.systemFont(ofSize: regularFontSize)}

    func bold(_ value: String) -> NSMutableAttributedString {

        guard let forColor = UIColor.defaultFontColor else {
            assertionFailure("No such color")
            return NSMutableAttributedString()
        }

        let attributes: [NSAttributedString.Key: Any] = [
            .font: boldFont,
            .foregroundColor: forColor
        ]

        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }

    func normal(_ value: String) -> NSMutableAttributedString {

        guard let forColor = UIColor.defaultFontColor else {
            assertionFailure("No such color")
            return NSMutableAttributedString()
        }

        let attributes: [NSAttributedString.Key: Any] = [
            .font: regularFont,
            .foregroundColor: forColor
        ]

        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }

    func normalGrey(_ value: String) -> NSMutableAttributedString {

        guard let forColor = UIColor.defaultGreyColor else {
            assertionFailure("No such color")
            return NSMutableAttributedString()
        }

        let attributes: [NSAttributedString.Key: Any] = [
            .font: regularFont,
            .foregroundColor: forColor
        ]

        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }

    func mainGreenHighlightBold(_ value: String) -> NSMutableAttributedString {

        guard let forColor = UIColor.mainGreen else {
            assertionFailure("No such color")
            return NSMutableAttributedString()
        }

        let attributes: [NSAttributedString.Key: Any] = [
            .font: boldFont,
            .foregroundColor: forColor

        ]

        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }

    func mainGreenHighlightRegular(_ value: String) -> NSMutableAttributedString {

        guard let forColor = UIColor.mainGreen else {
            assertionFailure("No such color")
            return NSMutableAttributedString()
        }

        let attributes: [NSAttributedString.Key: Any] = [
            .font: regularFont,
            .foregroundColor: forColor
        ]

        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }

    func blackHighlight(_ value: String) -> NSMutableAttributedString {

        let attributes: [NSAttributedString.Key: Any] = [
            .font: regularFont,
            .foregroundColor: UIColor.white,
            .backgroundColor: UIColor.black
        ]

        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }

    func underlined(_ value: String) -> NSMutableAttributedString {

        let attributes: [NSAttributedString.Key: Any] = [
            .font: regularFont,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]

        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
}
