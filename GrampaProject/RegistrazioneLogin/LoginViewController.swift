//
//  LoginViewController.swift
//  GrampaProject
//
//  Created by Paolo Di Stasio on 14/05/2020.
//  Copyright © 2020 Alessandro dovere. All rights reserved.
//

import SwiftUI
import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    
    var variables = Variables()

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
    }
    
    func setUpElements(){
        
        errorLabel.alpha = 0
        
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
    }
    
   
   
    @IBAction func loginTapped(_ sender: Any) {
        
     //Controllare text field
        
     //creo versioni pulite dell'email e della password
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
     //Signin dell'utente
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }else {
                UserDefaults.standard.set(result?.user.uid,forKey: "IDuser")
                let contentView = ContentView().environmentObject(self.variables)
                self.view.window?.rootViewController = UIHostingController(rootView: contentView)
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
}
