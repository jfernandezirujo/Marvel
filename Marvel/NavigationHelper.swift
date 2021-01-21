//
//  NavigationHelper.swift
//  Marvel
//
//  Created by Josefina Perez on 19/01/2021.
//  Copyright © 2021 Julieta Fernández Irujo. All rights reserved.
//

import Foundation
import UIKit

class NavigationHelper {
    
    static func changeRoot(authenticated: Bool) {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var rootViewControllerIdentifier: String = authenticated ? "tab" : "auth"
        let rootViewController = mainStoryboard.instantiateViewController(withIdentifier: rootViewControllerIdentifier)
        UIApplication.shared.windows.first?.rootViewController = UINavigationController(rootViewController: rootViewController)
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
