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
        guard let notNilCity = City(with: ["CDMX", "Mexico"]) else {
            XCTFail("Error nil instance")
        }
        XCTAssertNotNil(notNilCity)
        XCTAssertEqual(notNilCity.name, "CDMX")
        XCTAssertEqual(notNilCity.country, "Mexico")
        
        // city with name, country and imageurl
        guard let cityWithURL = City(with: ["CDMX", "Mexico", "https://image-url.com"]) else {
            XCTFail("Error nil instance")
        }
        XCTAssertNotNil(cityWithURL)
        XCTAssertEqual(cityWithURL.name, "CDMX")
        XCTAssertEqual(cityWithURL.country, "Mexico")
        XCTAssertEqual(cityWithURL.imageURL, URL(string: "https://image-url.com"))
        XCTAssertNil(cityWithURL.description)
        
        // city with name, country and description
        guard let cityWithDescription = City(with: ["CDMX", "Mexico", "", "Description"]) else {
            XCTFail("Error nil instance")
        }
        XCTAssertNotNil(cityWithDescription)
        XCTAssertEqual(cityWithDescription.name, "CDMX")
        XCTAssertEqual(cityWithDescription.country, "Mexico")
        XCTAssertNil(cityWithDescription.imageURL)
        XCTAssertEqual(cityWithDescription.description ?? "", "Description")
        
        // complete city
        guard let city = City(with: ["CDMX", "Mexico", "https://image-url.com", "Description"]) else {
            XCTFail("Error nil instance")
        }
        XCTAssertNotNil(city)
        XCTAssertEqual(city.name, "CDMX")
        XCTAssertEqual(city.country, "Mexico")
        XCTAssertEqual(city.imageURL, URL(string: "https://image-url.com"))
        XCTAssertEqual(city.description ?? "", "Description")
        
        // complete city with more components
        guard let cityMoreComps = City(with: ["CDMX", "Mexico", "https://image-url.com", "Description", " with more information"]) else {
            XCTFail("Error nil instance")
        }
        XCTAssertNotNil(cityMoreComps)
        XCTAssertEqual(cityMoreComps.name, "CDMX")
        XCTAssertEqual(cityMoreComps.country, "Mexico")
        XCTAssertEqual(cityMoreComps.imageURL, URL(string: "https://image-url.com"))
        XCTAssertEqual(cityMoreComps.description ?? "", "Description, with more information")
    }

}
