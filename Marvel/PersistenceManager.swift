//
//  PersistenceManager.swift
//  Marvel
//
//  Created by Josefina Perez on 19/01/2021.
//  Copyright © 2021 Julieta Fernández Irujo. All rights reserved.
//

import Foundation

class PersistenceManager {
    
    static let shared = PersistenceManager()
    
    let defaults = UserDefaults.standard
    private let loggedInKey = "loggedIn"
    
    func isLoggedIn() -> Bool {
       return defaults.bool(forKey: loggedInKey)
    }
    
    func logIn() {
        defaults.set(true, forKey: loggedInKey)
    }

}
