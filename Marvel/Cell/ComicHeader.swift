//
//  ComicHeader.swift
//  Marvel
//
//  Created by Josefina Perez on 22/01/2021.
//  Copyright © 2021 Julieta Fernández Irujo. All rights reserved.
//

import Foundation
import UIKit

class ComicHeader: UITableViewHeaderFooterView {
    
    @IBOutlet var lblTitle: UILabel!
    
    func configure(title: String) {
        lblTitle.text = title
        lblTitle.configureLblCellComic()
    }
}
