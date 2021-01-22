//
//  Event.swift
//  Marvel
//
//  Created by Josefina Perez on 20/01/2021.
//  Copyright © 2021 Julieta Fernández Irujo. All rights reserved.
//

import Foundation
import SwiftyJSON

class Event {
    
    var title: String
    var start: String
    var end: String
    var startDate: Date
    var endDate: Date
    var thumbnail: String
    var comics: [String] = []
    
    
    init(json: JSON) {
        self.title = json["title"].stringValue
        
        self.startDate = json["start"].stringValue.toDateWith(format: "yyyy-MM-dd HH:mm:ss") ?? Date()
        
        self.start = startDate.toStringWith(format: "d 'de' MMMM yyyy") ?? ""
        
        self.endDate = json["end"].stringValue.toDateWith(format: "yyyy-MM-dd HH:mm:ss") ?? Date()
        
        self.end = endDate.toStringWith(format: "d 'de' MMMM yyyy") ?? ""
        var url = "\(json["thumbnail"]["path"].stringValue).\(json["thumbnail"]["extension"].stringValue)"
        url.insert("s", at: url.index(url.startIndex, offsetBy: 4))
        self.thumbnail = url
        
        let comicsJson = json["comics"]["items"].arrayValue
            
            for comic in comicsJson {
                comics.append(comic["name"].stringValue)
        }
    }
}
