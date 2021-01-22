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
    var thumbnail: String
    var comics: [String] = []
    
    
    init(json: JSON) {
        self.title = json["title"].stringValue
        
        let startDate = json["start"].stringValue.toDateWith(format: "yyyy-MM-dd HH:mm:ss")
        
        self.start = startDate?.toStringWith(format: "d 'de' MMMM YYYY") ?? ""
        
        let endDate = json["end"].stringValue.toDateWith(format: "yyyy-MM-dd HH:mm:ss")
        
        self.end = endDate?.toStringWith(format: "d 'de' MMMM YYYY") ?? ""
        var url = "\(json["thumbnail"]["path"].stringValue).\(json["thumbnail"]["extension"].stringValue)"
        url.insert("s", at: url.index(url.startIndex, offsetBy: 4))
        self.thumbnail = url
        
        let comicsJson = json["comics"]["items"].arrayValue
            
            for comic in comicsJson {
                comics.append(comic["name"].stringValue)
        }
    }
}
