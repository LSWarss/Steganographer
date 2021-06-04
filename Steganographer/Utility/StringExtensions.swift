//
//  StringExtensions.swift
//  Steganographer
//
//  Created by Lukasz Stachnik on 31/05/2021.
//

import Foundation

extension String {
    func stringToBinary() -> String {
        let st = self
        var result = ""
        for char in st.utf8 {
            var tranformed = String(char, radix: 2)
            while tranformed.count < 8 {
                tranformed = "0" + tranformed
            }
            let binary = "\(tranformed) "
            result.append(binary)
        }
        return result
    }
}
