//
//  StringTests.swift
//  CitiesTests
//
//  Created by Alexander Camacho on 3/14/19.
//  Copyright © 2019 FixieDev. All rights reserved.
//

import XCTest

class StringTests: XCTestCase {


    func testIsBlank() {
        let blank = ""
        XCTAssertTrue(blank.isBlank)
        
        let whiteSpace = " "
        XCTAssertTrue(whiteSpace.isBlank)
        
        let withChars = "Some"
        XCTAssertFalse(withChars.isBlank)
    }
    
    func testCleanUp() {
        let simpleVal = "Some text without \" at the beginning or end"
        XCTAssertEqual(simpleVal.cleanUpValue(), simpleVal)
        
        let beginningVal = "\"Some text with \" at the beginning"
        XCTAssertEqual(beginningVal.cleanUpValue(), "Some text with \" at the beginning")
        
        let completeVal = "\"Some text with \" at the beginning and at the end\""
        XCTAssertEqual(completeVal.cleanUpValue(), "Some text with \" at the beginning and at the end")
        
        let endVal = "Some text with \" at the beginning\""
        XCTAssertEqual(endVal.cleanUpValue(), "Some text with \" at the beginning")
    }
    
    func testRemoveCharAtLast() {
        let simpleVal = "Some text value"
        XCTAssertEqual(simpleVal.removeCharAtLast(char: "."), simpleVal)
        XCTAssertEqual(simpleVal.removeCharAtLast(char: "e"), "Some text valu")
    }
    
    func testRemoveCharAtFirst() {
        let simpleVal = "Some text value"
        XCTAssertEqual(simpleVal.removeCharAtFirst(char: "."), simpleVal)
        XCTAssertEqual(simpleVal.removeCharAtFirst(char: "S"), "ome text value")
    }
    

}
