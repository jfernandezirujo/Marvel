//
//  TabBarViewController.swift
//  Marvel
//
//  Created by Josefina Perez on 18/01/2021.
//  Copyright © 2021 Julieta Fernández Irujo. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureItems()
    }
    

    func configureItems() {
        tabBar.items?[0].title = "Personajes"
        tabBar.items?[0].image = UIImage(named: "ironB")
        
        tabBar.items?[1].title = "Eventos"
        tabBar.items?[1].image = UIImage(systemName: "calendar")
    
        
    }
}
