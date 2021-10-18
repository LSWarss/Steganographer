//
//  RoundedButton.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 18/10/2021.
//

import Foundation
import UIKit

@IBDesignable class RoundedButton : UIButton {
    
    // Allows developer to edit what colors are shown in each state
    @IBInspectable var borderColorSelected:UIColor = UIColor.purple
    @IBInspectable var borderColorDeselected:UIColor = UIColor.purple
    
    // Width of Dashed/Solid Border
    @IBInspectable var borderWidth:CGFloat = 3
    // Radius of corners of the button
    @IBInspectable var cornerRadius:CGFloat = 10
    
    // The text that's shown in each state
    @IBInspectable var selectedText:String = "Selected"
    @IBInspectable var deselectedText:String = "Deselected"
    
    // The color of text shown in each state
    @IBInspectable var textColorDeselected:UIColor = UIColor.lightGray
    @IBInspectable var textColorSelected:UIColor = UIColor.black
    
    // Sets the Active/Inactive State
    @IBInspectable var active:Bool = false
    
    // Custom Border to the UIButton
    private let border = CAShapeLayer()
    
    override func draw(_ rect: CGRect) {
        border.lineWidth = borderWidth
        border.frame = self.bounds
        border.fillColor = nil // this will allow the background color of the UIButton to shine through
        border.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
        self.layer.addSublayer(border)
        
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true // mask anything outside of the that custom corner radius.
        
        border.strokeColor = borderColorSelected.cgColor
        self.setTitle(selectedText, for: .normal)
        self.setTitleColor(textColorSelected, for: .normal)
    }
    
    @objc func onPress() {
        print("Button Pressed")
        active = !active
        
        if active {
            setSelected()
        } else {
            setDeselected()
        }
    }
    
    
    // Set the selected properties
    func setSelected() {
        border.lineDashPattern = nil
        border.strokeColor = borderColorSelected.cgColor
        self.setTitle(selectedText, for: .normal)
        self.setTitleColor(textColorSelected, for: .normal)
    }

    // Set the deselcted properties
    func setDeselected() {
        border.lineDashPattern = [4, 4]
        border.strokeColor = borderColorDeselected.cgColor
        self.setTitle(deselectedText, for: .normal)
        self.setTitleColor(textColorDeselected, for: .normal)
    }
}
