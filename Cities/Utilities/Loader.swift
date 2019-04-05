//
//  Loader.swift
//  Cities
//
//  Created by Alexander Camacho on 3/14/19.
//  Copyright © 2019 FixieDev. All rights reserved.
//

import UIKit

protocol Loader {
    var spinner: UIActivityIndicatorView { get }
}

extension Loader {
    
    func setupSpinner(inView view: UIView) {
        spinner.backgroundColor = .lightGray
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.layer.cornerRadius = 8
        view.addSubview(spinner)
        view.addConstraints([spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                             spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                             spinner.widthAnchor.constraint(equalToConstant: 75),
                             spinner.heightAnchor.constraint(equalToConstant: 75)])
    }
    
    func showSpinner() {
        spinner.isHidden = false
        spinner.startAnimating()
    }
    
    func hideSpinner() {
        DispatchQueue.main.async {
            self.spinner.stopAnimating()
        }
    }
}
