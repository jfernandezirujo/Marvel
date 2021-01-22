//
//  CharactersViewController.swift
//  Marvel
//
//  Created by Josefina Perez on 18/01/2021.
//  Copyright © 2021 Julieta Fernández Irujo. All rights reserved.
//

import UIKit


class CharactersViewController: UIViewController {

    @IBOutlet var table: UITableView!
    
    var arrayCharacters: [Character] = [] {
        didSet {
        table.reloadData()
    }}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        getCharacters()
        table.register(UINib(nibName: "CharacterTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        table.delegate = self
       
    }

    
    func configureUI() {
        title = "Personajes"
        view.backgroundColor = .veryLightGray
        table.backgroundColor = .veryLightGray
    }
    
    
    func getCharacters() {
       NetworkManager.shared.getCharacters(completionHandler: { characters, error in
            
            if let error = error {
                print(error)
            }
            
            else {
                self.arrayCharacters = characters
            }
        })
    }
}

extension CharactersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell: CharacterTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CharacterTableViewCell else { return UITableViewCell() }
        
        cell.configureCell(character: arrayCharacters[indexPath.section])
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayCharacters.count
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        var view = UIView()
        view.backgroundColor = .clear
        
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "details") as? CharacterDetailViewController else { return }
        
        vc.character = arrayCharacters[indexPath.section]
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}
