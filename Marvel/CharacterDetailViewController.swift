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

    @IBOutlet var tableHeight: NSLayoutConstraint!
    
    @IBOutlet var imgCharacter: UIImageView!
    @IBOutlet var lblDescription: UILabel!
    @IBOutlet var lblComics: UILabel!
    @IBOutlet var table: UITableView!
    
    var character: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       configureUI()
        table.register(UINib(nibName: "ComicsTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        table.isScrollEnabled = false
        configureTableHeight()
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
        
        imgCharacter.contentMode = .scaleAspectFill
    }
    
    func configureTableHeight() {
        
        tableHeight.constant = CGFloat(character!.comics.count * 88)
     
        
    }

}

extension CharacterDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let character = character else { return 1 }
        
        return character.comics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    
        guard let cell: ComicsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ComicsTableViewCell else { return UITableViewCell() }
        
        cell.configureCell(comicTitle: (character?.comics[indexPath.row])!)

        return cell
    }
    
    
}
