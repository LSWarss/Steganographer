//
//  Helpers.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 01/06/2021.
//

import Foundation
import SwiftImage

extension RGB where Channel == UInt8 {
    var bytes: [UInt8] { [red, green, blue] }
}

func getDocumentsDirectory() -> URL {
    // find all possible documents directories for this user
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

    // just send back the first one, which ought to be the only one
    return paths[0]
}


let picturesPath = URL(fileURLWithPath: #file)
    .deletingLastPathComponent()
    .deletingLastPathComponent()
    .deletingLastPathComponent()
    .appendingPathComponent("Pictures")


enum Options {
    case encoding
    case decoding
}
