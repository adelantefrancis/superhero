//
//  AppDelegate.swift
//  Superhero
//
//  Created by Francis Adelante on 2/5/25.
//

import UIKit
import IQKeyboardManager
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var baseNavigation: UIViewController!
    var viewModel: MainViewModel!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
       
        IQKeyboardManager.shared().isEnabled = true
        
        viewModel = MainViewModel()
        let  heroInSession = viewModel.fetchHeroInSession()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        if heroInSession != nil {
            let vc = DrawerRootViewController()
            window?.rootViewController = UINavigationController(rootViewController: vc)
        } else {
            let vc = LoginViewController()
            window?.rootViewController = UINavigationController(rootViewController: vc)
        }
        window?.makeKeyAndVisible()
        
        return true
    }
}

