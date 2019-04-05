//
//  CityRouter.swift
//  Cities
//
//  Created by Alexander Camacho on 3/14/19.
//  Copyright © 2019 FixieDev. All rights reserved.
//

import UIKit

final class CityRouter: RouterProtocol {
    typealias T = City
    
    func go(to route: Route<City>, from origin: UIViewController, options: [String: Any]? = nil) {
        switch route {
        case .detail(let city):
            let detailView = CityDetailTableViewController(city: city)
            origin.show(detailView, sender: nil)
        default:
            print("⚠️⚠️ Routing case not recognized or not implemented.")
        }
    }
    
}
