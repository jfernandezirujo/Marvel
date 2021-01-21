//
//  UILabel+Extension.swift
//  Marvel
//
//  Created by Josefina Perez on 20/01/2021.
//  Copyright © 2021 Julieta Fernández Irujo. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    func configureLblTitle() {
        textColor = .black
        font = UIFont(name: "RobotoCondensed-Regular", size: 24)
        
    }
    
    func configureLblBody() {
        textColor = .darkBlue
        font = UIFont(name: "Roboto-Regular", size: 14)
    }
    
    func configureLblCellComic() {
        textColor = .black
        font = UIFont(name: "Roboto-Regular", size: 16)
        
    }
    
}
