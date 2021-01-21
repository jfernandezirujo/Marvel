//
//  AppDelegate.swift
//  Marvel
//
//  Created by Josefina Perez on 18/01/2021.
//  Copyright © 2021 Julieta Fernández Irujo. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        configureNavBar()
    
        
        return true
    }

    private func configureNavBar() {
        UINavigationBar.appearance().barTintColor = .almostBlack
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white, .font : UIFont(name: "RobotoCondensed-Bold", size: 20)]
        UINavigationBar.appearance().isTranslucent = false
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
    }


}

