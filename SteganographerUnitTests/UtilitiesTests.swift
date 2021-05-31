//
//  UtilitiesTests.swift
//  SteganographerUnitTests
//
//  Created by Lukasz Stachnik on 31/05/2021.
//

import XCTest

class UtilitiesTests: XCTestCase {
    
    func testStringToBinaryType() {
        let testString : String = "test"
        
        XCTAssertNotNil(testString.stringToBinary())
        XCTAssertTrue(testString.stringToBinary() is String)
    }

    func testStringToBinary() {
        let testString : String = "test"
        let assertionValue = "01110100 01100101 01110011 01110100 "
        
        XCTAssertEqual(testString.stringToBinary(), assertionValue)
    }

}
