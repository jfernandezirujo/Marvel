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
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var offset = 0
    
    var arrayCharacters: [Character] = [] {
        didSet {
            activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
            table.isHidden = false
            table.reloadData()
            offset = arrayCharacters.count
    }}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        configureUI()
        getCharacters()
        table.register(UINib(nibName: "CharacterTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        table.delegate = self
    }

    
    func configureUI() {
        title = "Personajes"
        view.backgroundColor = .veryLightGray
        table.backgroundColor = .veryLightGray
        table.isHidden = true
    }
    
    
    func getCharacters() {
        NetworkManager.shared.getCharacters(offset: offset, completionHandler: { characters, error in
            
            if let error = error {
                self.showAlert(title: "Error", msg: error.localizedDescription)
            }
            
            else {
                self.arrayCharacters.append(contentsOf: characters)
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
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "details") as? CharacterDetailViewController else { return }
        
        vc.character = arrayCharacters[indexPath.section]
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath == IndexPath(row: 0, section: arrayCharacters.count - 1) {
            getCharacters()
        }
    }
}
