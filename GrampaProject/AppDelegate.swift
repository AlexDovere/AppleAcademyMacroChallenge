//
//  AppDelegate.swift
//  GrampaProject
//
//  Created by Alessandro dovere on 11/05/2020.
//  Copyright © 2020 Alessandro dovere. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        let appeareance = UINavigationBarAppearance()
//        appeareance.configureWithTransparentBackground()
//        appeareance.backgroundColor = #colorLiteral(red: 1, green: 0.7450980392, blue: 0.1921568627, alpha: 1)
//        let attrs: [NSAttributedString.Key: Any] = [
//            .foregroundColor : UIColor.white,
//            .font : UIFont.monospacedSystemFont(ofSize: 36, weight: .bold)
//        ]
//        
//        appeareance.largeTitleTextAttributes = attrs
//        UINavigationBar.appearance().scrollEdgeAppearance = appeareance
       FirebaseApp.configure()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

