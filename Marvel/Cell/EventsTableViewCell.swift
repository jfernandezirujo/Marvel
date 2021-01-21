//
//  EventsTableViewCell.swift
//  Marvel
//
//  Created by Josefina Perez on 20/01/2021.
//  Copyright © 2021 Julieta Fernández Irujo. All rights reserved.
//

import UIKit
import Kingfisher

class EventsTableViewCell: UITableViewCell {

    @IBOutlet var lbltitle: UILabel!
    @IBOutlet var lblStart: UILabel!
    @IBOutlet var lblEnd: UILabel!
    @IBOutlet var imgEvent: UIImageView!
    @IBOutlet var imgArrow: UIImageView!
    
    func configureCell(event: Event) {
        lbltitle.text = event.title
        lbltitle.configureLblTitle()
        lblStart.text = event.start
        lblStart.configureLblBody()
        lblEnd.text = event.end
        lblEnd.configureLblBody()
        configureImg(Url: event.thumbnail)
        
        imgArrow.image = UIImage(systemName: "chevron.down")

        
    }
    
    func configureImg(Url: String) {
        let url = URL(string: Url)
        imgEvent.kf.setImage(with: url)
        
        
    }
    
}

