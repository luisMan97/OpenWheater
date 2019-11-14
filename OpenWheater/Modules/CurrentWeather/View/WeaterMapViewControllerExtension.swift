//
//  WeaterMapViewControllerExtension.swift
//  OpenWheater
//
//  Created by Jorge Luis Rivera Ladino on 14/11/19.
//  Copyright © 2019 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit
import CoreLocation

// MARK: - CLLocationManagerDelegate
extension WeaterMapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        
        if !getWeatherBylocation {
            getWeatherBylocation(latitude: location.latitude, longitude: location.longitude)
            
            getWeatherBylocation = true
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.denied {
            showLocationDisabledPopUp()
        }
    }
    
}

// MARK: - This functions are called in CLLocationManagerDelegate
private extension WeaterMapViewController {
    
    func getWeatherBylocation(latitude: Double, longitude: Double) {
        showIndicator(true)
        locationManager.stopUpdatingLocation()
        viewModel.getWeatherByLocation(lat: latitude, Long: longitude) { [weak self] (success, error) in
            self?.showIndicator(false)
            guard let strongSelf = self else { return }
            
            if let error = error {
                strongSelf.presentAlertError(error: error)
            } else if success != nil {
                strongSelf.updateData()
            }
        }
    }
    
    func showLocationDisabledPopUp() {
        presentAlertWith(title: "Location Access Disabled", message: "We need your location for show your Weather", leftActionText: "Cancel", rightActionText: "Open Settings") { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
}
