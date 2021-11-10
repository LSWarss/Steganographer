//
//  UIViewController.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 07/11/2021.
//

import Foundation
import UIKit    

// Alert function in shared class
extension UIViewController {
    func showAlert(title: String, msg: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
