//
//  UIViewControllerExtension.swift
//  OpenWheater
//
//  Created by Jorge Luis Rivera Ladino on 13/11/19.
//  Copyright © 2019 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

extension UIViewController {
    
    typealias AlertActionHandler = ((UIAlertAction) -> Void)?
    
    func presentAlertWith(title: String, message: String, leftActionText: String? = nil, rightActionText: String? = nil, leftHandler: AlertActionHandler = nil, rightHandler: AlertActionHandler = nil) {
        let alert = UIAlertController.alertWith(title: title, message: message, leftActionText: leftActionText, rightActionText: rightActionText, leftHandler: leftHandler, rightHandler: rightHandler)
        present(alert, animated: true, completion: nil)
    }
    
    func presentAlertError(title: String = "error", error: Error, rightHandler: AlertActionHandler = nil) {
        if let message: String = error._userInfo?["message"] as? String {
            presentAlertWith(title: title, message: message, rightHandler: rightHandler)
        }
    }

}
