//
//  BaseViewController.swift
//  Superhero
//
//  Created by Francis Adelante on 2/5/25.
//

import UIKit
import SnapKit
import SPAlert

class BaseViewController: UIViewController {
    lazy var alertView: AlertAppleMusic17View! = nil
   
    let delayAsSecond = 2.0
    lazy var mainViewModel: MainViewModel = {
        return MainViewModel()
    }()
    
    func setupNavigation(setHidden:Bool = true){
        self.navigationController?.setNavigationBarHidden(setHidden, animated: true)
    }
    
    func push(destination:UIViewController, animated:Bool = true){
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(destination, animated: animated)
        }
    }
    
    func popViewController(toRoot: Bool = false, animated:Bool = true){
        DispatchQueue.main.async {
            if toRoot {
                self.navigationController?.popToRootViewController(animated: animated)
            } else {
                self.navigationController?.popViewController(animated: animated)
            }
        }
    }
    
    func showAlert(title: String, message: String, icon: AlertIcon, textColor: UIColor = .shCharcoal){
        alertView = AlertAppleMusic17View(title: title, subtitle: message, icon: icon)
        
        alertView.titleLabel?.font = UIFont(name: Design.SPFonts().arialBold, size: 15)
        alertView.titleLabel?.textColor = textColor
        alertView.present(on: view)
    }
    
    func dismissAlert(){
        alertView.dismiss()
    }
    
    func showUnderConstructionAlert(){
        showAlert(title: "Soon!", message: "Under contruction.", icon:.custom(UIImage(systemName: "hammer.fill")!), textColor: .shRed)
    }
    
    func delay(seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
    
    @objc func hardLogout(){
        
        DispatchQueue.main.async {
            self.mainViewModel.logout()
            var baseNavigation: UIViewController!
            baseNavigation = UINavigationController(rootViewController: LoginViewController())
            
            self.view.window?.rootViewController = baseNavigation
            self.view.window?.makeKeyAndVisible()
        }
    }
}

