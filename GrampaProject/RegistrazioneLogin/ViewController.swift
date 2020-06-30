//
//  LoginPageViewController.swift
//  GrampaProject
//
//  Created by Paolo Di Stasio on 13/05/2020.
//  Copyright © 2020 Alessandro dovere. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import FirebaseUI

class ViewController: UIViewController{
    
    @IBOutlet weak var skipButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    var variables = Variables()

    
    override func viewDidLoad() {
      super.viewDidLoad()
 
       
        setUpElements()
    }
    
    func setUpElements() {
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(skipButton)
    }

    @IBAction func skipTapped(_ sender: Any) {
        
        
    



        let contentView = ContentView().environmentObject(variables)
        self.view.window?.rootViewController = UIHostingController(rootView: contentView)
        self.view.window?.makeKeyAndVisible()
       
    
        
    }
    
}



struct LoginPageView : UIViewControllerRepresentable {

    
    // 2.
    func makeUIViewController(context: Context) -> ViewController {
        let teststoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController: ViewController = teststoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        return viewController
    }
    
    // 3.
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        
    }
}



struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
