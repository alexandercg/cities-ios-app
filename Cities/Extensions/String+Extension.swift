//
//  String+Extension.swift
//  Cities
//
//  Created by Alexander Camacho on 3/14/19.
//  Copyright © 2019 FixieDev. All rights reserved.
//

import UIKit

extension String {
    // remove the end
    func removeCharAtLast(char: String) -> String {
        if hasSuffix(char){
            return String(dropLast(char.count))
        }
        return self
    }
    
    // remove the beginning
    func removeCharAtFirst(char: String) -> String {
        if hasPrefix(char){
            return String(dropFirst(char.count))
        }
        return self
    }
    
    // validate if the value is blank
    var isBlank: Bool {
        let trimmed = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return trimmed.isEmpty
    }
    
    // Remove the " symbol at the beginning and the end
    func cleanUpValue() -> String {
        return self.removeCharAtFirst(char: "\"").removeCharAtLast(char: "\"")
    }
    
    // get height, calculated by font and specific width
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
}
