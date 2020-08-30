//
//  AppDelegate.swift
//  SampleProject
//
//  Created by kurokawahirokazu on 2020/08/30.
//  Copyright © 2020 kurokawahirokazu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var navigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let sb = UIStoryboard(name: "StartUp", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "StartUpViewController")
        
        navigationController = UINavigationController(rootViewController: vc)
        navigationController?.setNavigationBarHidden(true, animated: false)
        window!.rootViewController = navigationController
        window!.makeKeyAndVisible()
        
        return true
    }
    
}

