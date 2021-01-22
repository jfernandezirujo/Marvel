//
//  String+Extension.swift
//  Marvel
//
//  Created by Josefina Perez on 21/01/2021.
//  Copyright © 2021 Julieta Fernández Irujo. All rights reserved.
//

import Foundation

extension String {
    
    func toDateWith(format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = .init(identifier: "es_ES")
        return formatter.date(from: self)
    }
}
