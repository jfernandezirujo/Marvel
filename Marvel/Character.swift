//
//  Character.swift
//  Marvel
//
//  Created by Josefina Perez on 19/01/2021.
//  Copyright © 2021 Julieta Fernández Irujo. All rights reserved.
//

import Foundation
import SwiftyJSON

class Character {
    
    var name: String
    var description: String
    var thumbnail: String 
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.description = json["description"].stringValue
        var url = "\(json["thumbnail"]["path"].stringValue).\(json["thumbnail"]["extension"].stringValue)"
        url.insert("s", at: url.index(url.startIndex, offsetBy: 4))
        self.thumbnail = url
    }
}
