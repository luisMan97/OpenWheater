//
//  WheaterMapViewController.swift
//  OpenWheater
//
//  Created by Jorge Luis Rivera Ladino on 13/11/19.
//  Copyright © 2019 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

class WheaterMapViewController: UIViewController {
    
    // View Model
    let viewModel = WheaterMapViewModel()

    // MARK: - UIViewController Lifecycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWheaterByCity()
    }
    
    // MARK: - Internal Methods
    
    private func getWheaterByCity() {
        viewModel.getWheaterByCity() { [weak self] (success, error) in
            guard let strongSelf = self else { return }
            
            if let error = error {
                strongSelf.presentAlertError(error: error)
            } else if success != nil {
                strongSelf.presentAlertWith(title: "", message: "Success")
            }
        }
    }


}

