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
        txtFieldEmail.delegate = self
        txtFieldPassword.delegate = self
        
        btnLogIn.setTitle("Iniciar Sesión", for: .normal)
        btnLogIn.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 17.0)
        btnLogIn.backgroundColor = .almostBlack
        btnLogIn.tintColor = .white
        btnLogIn.layer.cornerRadius = 6
        
        
        btnSignUp.setTitle("Registrarse", for: .normal)
        btnLogIn.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 17.0)
        btnSignUp.backgroundColor = .veryLightGray
        btnSignUp.tintColor = .black
        btnSignUp.layer.cornerRadius = 6
    }
    
    func showHome() {
        PersistenceManager.shared.logIn()
        NavigationHelper.changeRoot(authenticated: true)
    }
    
    @IBAction func logIn() {
            
        if let email = txtFieldEmail.text, let password = txtFieldPassword.text {
                
                Auth.auth().signIn(withEmail: email, password: password, completion: { result, error in
                    
                    if let _ = error {
                        self.showAlert(title: "Error", msg: "Error al iniciar sesión")
                    }
                    
                    else if let _ = result {
                        self.showHome()
                    }
                })
            }
        }

    
    @IBAction func signUp() {
        if let email = txtFieldEmail.text, let password = txtFieldPassword.text {
            
            Auth.auth().createUser(withEmail: email, password: password, completion: { result, error in
                
                if let error = error {
                    self.showAlert(title: "Error", msg: "Error al registrarse")
                }
                
                else if let result = result {
                    self.showHome()
                }
            })
        }
        
        
    }
    

}

extension AuthenticationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
