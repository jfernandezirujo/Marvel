//
//  AuthenticationViewController.swift
//  Marvel
//
//  Created by Josefina Perez on 18/01/2021.
//  Copyright © 2021 Julieta Fernández Irujo. All rights reserved.
//

import UIKit
import FirebaseAuth

class AuthenticationViewController: UIViewController {

    @IBOutlet var txtFieldEmail: UITextField!
    @IBOutlet var txtFieldPassword: UITextField!
    @IBOutlet var btnLogIn: UIButton!
    @IBOutlet var btnSignUp: UIButton!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    func configureUI() {
        title = "Autenticación"
        
        txtFieldEmail.placeholder = "Email"
        txtFieldEmail.keyboardType = .emailAddress
        
        txtFieldPassword.placeholder = "Contraseña"
        
        btnLogIn.setTitle("Iniciar Sesión", for: .normal)
        btnLogIn.backgroundColor = UIColor(displayP3Red: 38 / 255, green: 38 / 255 , blue: 38 / 255, alpha: 1)
        btnLogIn.tintColor = UIColor(displayP3Red: 237 / 255, green: 239 / 255, blue: 241 / 255 , alpha: 1)
        btnLogIn.layer.cornerRadius = 6
        
        btnSignUp.setTitle("Registrarse", for: .normal)
        btnSignUp.backgroundColor = UIColor(displayP3Red: 237 / 255, green: 239 / 255, blue: 241 / 255 , alpha: 1)
        btnSignUp.tintColor = UIColor(displayP3Red: 38 / 255, green: 38 / 255 , blue: 38 / 255, alpha: 1)
        btnSignUp.layer.cornerRadius = 6
    }
    
    @IBAction func LogIn() {
        
    }
    
    @IBAction func SignUp() {
        
    }
    

}
