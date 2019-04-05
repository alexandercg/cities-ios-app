//
//  RouterProtocol.swift
//  Cities
//
//  Created by Alexander Camacho on 3/14/19.
//  Copyright © 2019 FixieDev. All rights reserved.
//

import UIKit

protocol RouterProtocol {
    associatedtype T
    
    func go(to route: Route<T>, from origin: UIViewController, options: [String: Any]?)
}
