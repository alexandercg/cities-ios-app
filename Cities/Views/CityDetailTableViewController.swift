//
//  CityDetailTableViewController.swift
//  Cities
//
//  Created by Alexander Camacho on 3/14/19.
//  Copyright © 2019 FixieDev. All rights reserved.
//

import UIKit

class CityDetailTableViewController: UITableViewController {
    
    var city: City?
    
    init(city: City) {
        super.init(nibName: nil, bundle: nil)
        self.city = city
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        tableView.separatorStyle = .none
        tableView.register(CityTableViewCell.self, forCellReuseIdentifier: "CityTableViewCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return (city == nil) ? 0 : 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let city = city else {
            fatalError("Couldn't unwrap the city`")
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as? CityTableViewCell else {
            fatalError("Couldn't cast to `CityTableViewCell`")
        }
        cell.configure(with: city, isCollapsed: false)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CityTableViewCell.calculeHeight()
    }

}
