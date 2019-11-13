//
//  UIAlertControllerExtension.swift
//  OpenWheater
//
//  Created by Jorge Luis Rivera Ladino on 13/11/19.
//  Copyright © 2019 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    typealias AlertActionHandler = ((UIAlertAction) -> Void)?
    
    class func alertWith(title: String, message: String, leftActionText: String? = nil, rightActionText: String? = nil, leftHandler: AlertActionHandler, rightHandler: AlertActionHandler) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        var rightActionOKText = "OK"
        
        if leftActionText != nil {
            alert.addAction(UIAlertAction(title: leftActionText, style: .default, handler: leftHandler))
        }
        
        if let rightActionText = rightActionText {
            rightActionOKText = rightActionText
        }
        
        alert.addAction(UIAlertAction(title: rightActionOKText, style: .default, handler: rightHandler))
        
        return alert
    }
    
}

