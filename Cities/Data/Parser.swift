//
//  Parser.swift
//  Cities
//
//  Created by Alexander Camacho on 3/14/19.
//  Copyright © 2019 FixieDev. All rights reserved.
//

import Foundation

struct Parser {
    
    public static func readTextFile(_ filename: String, with bundle: Bundle = Bundle.main) -> String? {
        guard let path = bundle.path(forResource: filename, ofType: "txt") else {
            return nil
        }
        return (try? String(contentsOfFile: path, encoding: .utf8))
    }
    
    public static func parseToCities(_ filename: String, with bundle: Bundle = Bundle.main) -> [City] {
        
        guard let textFile = readTextFile(filename, with: bundle) else {
            return []
        }
        
        let list = textFile.components(separatedBy: "\n")
                           .map({ $0.components(separatedBy: ",") })
                           .compactMap({ City(with: $0) })
        return list
    }
    
}
