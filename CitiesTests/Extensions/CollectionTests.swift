//
//  CollectionTests.swift
//  CitiesTests
//
//  Created by Alexander Camacho on 3/14/19.
//  Copyright © 2019 FixieDev. All rights reserved.
//

import XCTest

class CollectionTests: XCTestCase {

    func testSafeSubscript() {
        
        //safe get nil
        let emptyList: [Int] = []
        XCTAssertNil(emptyList[safe:0])
        
        //one element list
        let oneElementList: [Int] = [2]
        XCTAssertNotNil(oneElementList[safe: 0])
        XCTAssertNil(oneElementList[safe: 1])
    }

}
