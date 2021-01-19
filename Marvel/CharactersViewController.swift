//
//  CharactersViewController.swift
//  Marvel
//
//  Created by Josefina Perez on 18/01/2021.
//  Copyright © 2021 Julieta Fernández Irujo. All rights reserved.
//

import UIKit

class CharactersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkManager.shared.getCharacters(completionHandler: { characters, error in
            
            if let error = error {
                print(error)
            }
            
            else{
                print(characters)
            }
           
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
