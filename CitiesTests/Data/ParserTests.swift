//
//  ParserTests.swift
//  CitiesTests
//
//  Created by Alexander Camacho on 3/14/19.
//  Copyright © 2019 FixieDev. All rights reserved.
//

import XCTest

class ParserTests: XCTestCase {
    
    @objc class TestClass: NSObject { }

    func testReadTextFile() {
        let bundle = Bundle(for: TestClass.self)
        
        let nilResult = Parser.readTextFile("noFile", with: bundle)
        XCTAssertNil(nilResult)
        
        let emptyResult = Parser.readTextFile("empty", with: bundle)
        XCTAssertNotNil(emptyResult)
        XCTAssertFalse(emptyResult!.isEmpty)
        XCTAssertTrue(emptyResult!.isBlank)
        
        let withContent = Parser.readTextFile("with-content", with: bundle)
        XCTAssertNotNil(withContent)
        XCTAssertFalse(withContent!.isEmpty)
        XCTAssertFalse(withContent!.isBlank)
        XCTAssertEqual(withContent!, "Has some content\n")
    }

    func testParseToCities() {
        let bundle = Bundle(for: TestClass.self)
        
        let noFileResult = Parser.parseToCities("noFile", with: bundle)
        XCTAssertTrue(noFileResult.isEmpty)
        
        let emptyFileResult = Parser.parseToCities("empty", with: bundle)
        XCTAssertTrue(emptyFileResult.isEmpty)
        
        let withContentResult = Parser.parseToCities("with-content", with: bundle)
        XCTAssertTrue(withContentResult.isEmpty)
        
        let withCitiesResult = Parser.parseToCities("test-cities", with: bundle)
        XCTAssertFalse(withCitiesResult.isEmpty)
    }

}
