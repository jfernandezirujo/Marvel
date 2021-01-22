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
        tabBar.frame.size.height = 56.0
        tabBar.tintColor = .almostBlack
        
        
    
        tabBar.items?[0].title = "Personajes"
        tabBar.items?[0].image = UIImage(named: "ironGray")
        tabBar.items?[0].selectedImage = UIImage(named: "ironYellow")
        
        tabBar.items?[1].title = "Eventos"
        tabBar.items?[1].image = UIImage(named: "calendarGray")
        tabBar.items?[1].selectedImage = UIImage(named: "icon-calendar-disabled")
       navigationItem.title = "Marvel Challenge"
    }
    

}