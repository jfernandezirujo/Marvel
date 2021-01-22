//
//  ComicsTableViewCell.swift
//  Marvel
//
//  Created by Josefina Perez on 21/01/2021.
//  Copyright © 2021 Julieta Fernández Irujo. All rights reserved.
//

import UIKit

class ComicsTableViewCell: UITableViewCell {

   static let cellHeight = 88.0
   @IBOutlet var lblComicTitle: UILabel!
    
    func configureCell(comicTitle: String) {
        lblComicTitle.text = comicTitle
        lblComicTitle.configureLblCellComic()
    }
        
}
