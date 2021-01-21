//
//  CharacterDetailsViewController.swift
//  Marvel
//
//  Created by Josefina Perez on 20/01/2021.
//  Copyright © 2021 Julieta Fernández Irujo. All rights reserved.
//

import UIKit
import Kingfisher

class CharacterDetailViewController: UIViewController {

    @IBOutlet var imgCharacter: UIImageView!
    @IBOutlet var lblDescription: UILabel!
    @IBOutlet var lblComics: UILabel!
    @IBOutlet var table: UITableView!
    
    var character: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       configureUI()
    }
    

    func configureUI() {
        guard let character = character else { return }
        title = character.name.uppercased()
        
        
        let url = URL(string: character.thumbnail)
        imgCharacter.kf.setImage(with: url)
        
        lblDescription.text = character.description
        lblDescription.configureLblBody()
        lblComics.text = "COMICS EN LOS QUE APARECE"
        lblComics.configureLblTitle()
        
        
    }

}
