//
//  Route.swift
//  Cities
//
//  Created by Alexander Camacho on 3/14/19.
//  Copyright © 2019 FixieDev. All rights reserved.
//

import Foundation

enum Route<T> {
    case all
    case detail(T)
    case custom(String)
}
