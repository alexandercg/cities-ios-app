//
//  CityTests.swift
//  CitiesTests
//
//  Created by Alexander Camacho on 3/14/19.
//  Copyright © 2019 FixieDev. All rights reserved.
//

import XCTest

class CityTests: XCTestCase {

    func testOptionalInit() {
        //empty components
        let nilCity = City(with: [])
        XCTAssertNil(nilCity)
        
        //one component
        let oneComponentCity = City(with: ["CDMX"])
        XCTAssertNil(oneComponentCity)
        
        // city with name and country
        let notNilCity = City(with: ["CDMX", "Mexico"])
        XCTAssertNotNil(notNilCity)
        XCTAssertEqual(notNilCity!.name, "CDMX")
        XCTAssertEqual(notNilCity!.country, "Mexico")
        
        // city with name, country and imageurl
        let cityWithURL = City(with: ["CDMX", "Mexico", "https://image-url.com"])
        XCTAssertNotNil(cityWithURL)
        XCTAssertEqual(cityWithURL!.name, "CDMX")
        XCTAssertEqual(cityWithURL!.country, "Mexico")
        XCTAssertEqual(cityWithURL!.imageURL, URL(string: "https://image-url.com"))
        XCTAssertNil(cityWithURL!.description)
        
        // city with name, country and description
        let cityWithDescription = City(with: ["CDMX", "Mexico", "", "Description"])
        XCTAssertNotNil(cityWithDescription)
        XCTAssertEqual(cityWithDescription!.name, "CDMX")
        XCTAssertEqual(cityWithDescription!.country, "Mexico")
        XCTAssertNil(cityWithDescription?.imageURL)
        XCTAssertEqual(cityWithDescription!.description!, "Description")
        
        // complete city
        let city = City(with: ["CDMX", "Mexico", "https://image-url.com", "Description"])
        XCTAssertNotNil(city)
        XCTAssertEqual(city!.name, "CDMX")
        XCTAssertEqual(city!.country, "Mexico")
        XCTAssertEqual(city!.imageURL, URL(string: "https://image-url.com"))
        XCTAssertEqual(city!.description!, "Description")
        
        // complete city with more components
        let cityMoreComps = City(with: ["CDMX", "Mexico", "https://image-url.com", "Description", " with more information"])
        XCTAssertNotNil(cityMoreComps)
        XCTAssertEqual(cityMoreComps!.name, "CDMX")
        XCTAssertEqual(cityMoreComps!.country, "Mexico")
        XCTAssertEqual(cityMoreComps!.imageURL, URL(string: "https://image-url.com"))
        XCTAssertEqual(cityMoreComps!.description!, "Description, with more information")
    }



}
