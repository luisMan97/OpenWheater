//
//  WeaterMapViewController.swift
//  OpenWheater
//
//  Created by Jorge Luis Rivera Ladino on 13/11/19.
//  Copyright © 2019 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit
import CoreLocation

class WeaterMapViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var geoCoordsLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView! {
        didSet {
            activityIndicator.isHidden = true
        }
    }
    
    // View Model
    let viewModel = WeaterMapViewModel()
    
    // Internal Properties
    var locationManager = CLLocationManager()
    var getWeatherBylocation = false

    // MARK: - UIViewController Lifecycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocation()
    }
    
    @IBAction func searchCityAction(_ sender: UIButton) {
        getWeatherByCity(city: cityNameTextField.text)
    }
    
    // MARK: - Internal Methods
    
    func showIndicator(_ show: Bool) {
        activityIndicator.isHidden = !show
        show ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
    }
    
    func updateData() {
        guard let weater = viewModel.weater else { return }
        
        contentView.isHidden = false
        
        if let name = weater.name {
            cityLabel.text = "Weather in \(name)"
        }
        if let temp = weater.main?.temp {
            tempLabel.text = "\(temp) °C"
        }
        windLabel.text = "Light breeze, \(weater.wind?.speed ?? 0) m/s, Northwest (\(weater.wind?.deg ?? 0))"
        mainLabel.text = weater.weatherDescription?.first?.main ?? ""
        pressureLabel.text = "\(weater.main?.pressure ?? 0) hpa"
        humidityLabel.text = "\(weater.main?.humidity ?? 0) %"
        sunriseLabel.text = String(weater.sys?.sunrise ?? 0)
        geoCoordsLabel.text = "[\(weater.coord?.lat ?? 0),\(weater.coord?.lon ?? 0)]"
    }
    
    // MARK: - Private Methods
    
    private func setupLocation() {
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
    private func getWeatherByCity(city: String?) {
        showIndicator(true)
        viewModel.getWeatherByCity(city: city) { [weak self] (success, error) in
            self?.showIndicator(false)
            guard let strongSelf = self else { return }
            
            if let error = error {
                strongSelf.presentAlertError(error: error)
            } else if success != nil {
                strongSelf.updateData()
            }
        }
    }
}
