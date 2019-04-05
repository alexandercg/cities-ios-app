//
//  CitiesTableViewController.swift
//  Cities
//
//  Created by Alexander Camacho on 3/14/19.
//  Copyright © 2019 FixieDev. All rights reserved.
//

import UIKit

class CitiesTableViewController: UITableViewController, Loader {
    
    let fileNameSource = "cities"
    
    var cityList: [City] = [] {
        didSet {
            DispatchQueue.main.async {
                self.hideSpinner()
                self.tableView.reloadData()
            }
        }
    }
    
    var spinner = UIActivityIndicatorView(style: .white)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cities"
        navigationController?.navigationBar.prefersLargeTitles = true

        tableView.separatorStyle = .none
        tableView.register(CityTableViewCell.self, forCellReuseIdentifier: "CityTableViewCell")
        
        setupSpinner(inView: navigationController?.view ?? view)
        
        showSpinner()
        loadCities()
    }
    
    func loadCities() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.cityList = Parser.parseToCities(self.fileNameSource)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return cityList.isEmpty ? 0 : 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as? CityTableViewCell else {
            fatalError("Couldn't cast to `CityTableViewCell`")
        }
        cell.configure(with: cityList[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CityTableViewCell.calculeHeight()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let city = cityList[safe: indexPath.row] {
            Router.cityRouter.go(to: .detail(city), from: self)
        }
    }

}
