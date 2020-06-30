//
//  SignUpViewController.swift
//  GrampaProject
//
//  Created by Paolo Di Stasio on 14/05/2020.
//  Copyright © 2020 Alessandro dovere. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore 
import SwiftUI

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var fullNameTextField: UITextField!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    var variables = Variables()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
    }
    
    func setUpElements() {
        
        errorLabel.alpha = 0
        
        Utilities.styleTextField(fullNameTextField)
        Utilities.styleTextField(phoneNumberTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
    }

//    serve a controllare tutti i dati che vengono inseriti. Return nil se tutto è corretto
    
    func ValidateFields() -> String? {
       
        //controllo che tutti i campi sono compilti
        if fullNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||  emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
            
        }
        
        //Aggiungere anche controllo mail
        let cleandedEmail = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isValidEmail(cleandedEmail) == false {
            return "Please insert a valid email."
        }
        
        //Controllo se la password è sicura
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(cleanedPassword) == false {
            //la password non è sicura
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        return nil
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        
        //Validate the fields
        let error = ValidateFields()
        
        if error != nil {
            //c'è un errore
            showError(error!)
              ContentView()
        }
        else {
            //Creo una versione pulita dei dati
            let fullName = fullNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
             let phoneNumber = phoneNumberTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
             let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
             let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
        //Create the user
            
            
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                //controllo errori durante la creazione dell'utente
                if err != nil {
                       ContentView()
                    // si è verificato un errore creando l'utente
                    self.showError("Error creating user")
                }
                else {
                    UserDefaults.standard.set(result?.user.uid, forKey: "IDuser")
                    //l'utente è stato creato con successo
                    let db = Firestore.firestore()
                    
                    db.collection("Users").addDocument(data: ["FullName": fullName, "PhoneNumber": phoneNumber, "uid": result!.user.uid]) { (error) in
                        
                        if error != nil {
                        //se ci sono errori
                            self.showError("Error saving user data")
                        }
                    }
                    
                    //Transition to the home screen
                    self.TransitionToHome()
                }
            }
        
        }
    }
    
    func TransitionToHome(){
        
        let contentView = ContentView().environmentObject(variables)
                      self.view.window?.rootViewController = UIHostingController(rootView: contentView)
                      self.view.window?.makeKeyAndVisible()
               
    }
    
    func showError(_ message:String) {
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    

}
