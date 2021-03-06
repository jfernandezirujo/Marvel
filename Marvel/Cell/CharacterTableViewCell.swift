//
//  CharacterTableViewCell.swift
//  Marvel
//
//  Created by Josefina Perez on 20/01/2021.
//  Copyright © 2021 Julieta Fernández Irujo. All rights reserved.
//

import UIKit
import Kingfisher


class CharacterTableViewCell: UITableViewCell {

    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblDescription: UILabel!
    @IBOutlet var img: UIImageView!
    
    func configureCell(character: Character) {
        lblName.text = character.name.uppercased()
        lblName.configureLblTitle()
        lblDescription.text = character.description
        lblDescription.configureLblBody()
        configureImg(characterUrl: character.thumbnail)
    }
    
    
    func configureImg(characterUrl: String) {
        let url = URL(string: characterUrl)
        img.contentMode = .scaleAspectFill
        img.kf.setImage(with: url)
    }    
}
