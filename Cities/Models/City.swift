//
//  City.swift
//  Cities
//
//  Created by Alexander Camacho on 3/14/19.
//  Copyright © 2019 FixieDev. All rights reserved.
//

import Foundation

struct City {
    var name: String
    var country: String
    var imageURL: URL?
    var description: String?
    
    init?(with components: [String]) {
        guard let name = components[safe: 0], !name.isBlank,
              let country = components[safe: 1], !country.isBlank else {
            return nil
        }
        
        self.name = name.cleanUpValue()
        self.country = country.cleanUpValue()
        
        if let stringURL = components[safe: 2],
           let url = URL(string: stringURL.cleanUpValue()) {
            self.imageURL = url
        }
        
        if components.count > 4 {
            let description = components[3..<components.count]
            self.description = description.joined(separator: ",").cleanUpValue()
        } else if let description = components[safe: 3], !description.isBlank {
            self.description = description.cleanUpValue()
        }
        
    }
    
}
