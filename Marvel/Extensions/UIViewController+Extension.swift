//
//  UIViewController+Extension.swift
//  Marvel
//
//  Created by Josefina Perez on 19/01/2021.
//  Copyright © 2021 Julieta Fernández Irujo. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(title: String? = nil, msg: String? = nil) {
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
        
        present(alert, animated: true)
    }
    
}
