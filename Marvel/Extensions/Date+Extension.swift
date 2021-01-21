//
//  Date+Extension.swift
//  Marvel
//
//  Created by Josefina Perez on 21/01/2021.
//  Copyright © 2021 Julieta Fernández Irujo. All rights reserved.
//

import Foundation

extension Date {
    
    func toStringWith(format: String) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = .init(identifier: "es_ES")
        return formatter.string(from: self)
    }
    
}
