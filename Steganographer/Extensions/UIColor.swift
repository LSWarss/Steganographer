//
//  UIColor.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 16/11/2021.
//

import Foundation
import UIKit

extension UIColor {

    public static var mainGreen = UIColor(named: "mainGreen")
    public static var defaultFontColor = UIColor(named: "defaultFontColor")
}

extension UIColor {

    class func randomColor() -> UIColor {

        let hue = CGFloat(arc4random() % 100) / 100
        let saturation = CGFloat(arc4random() % 100) / 100
        let brightness = CGFloat(arc4random() % 100) / 100

        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
    }
}
