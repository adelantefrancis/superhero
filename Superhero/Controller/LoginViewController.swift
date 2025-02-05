//
//  LoginViewController.swift
//  Superhero
//
//  Created by Francis Adelante on 2/5/25.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    lazy var viewModel: LoginViewModel = {
        return LoginViewModel()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func tappedForgotPassword() {
        view.endEditing(true)
        showUnderConstructionAlert()
    }
    
    @IBAction func tappedSignUp() {
        showUnderConstructionAlert()
    }
    
    @IBAction func tappedLogin() {
        view.endEditing(true)
        if isRequiredFieldFilled(){
            
            self.showAlert(title: "", message: "logging in..", icon: .spinnerSmall)
            delay(seconds: 2) { [self] in
                viewModel.delegate = self
                viewModel.processLogin(username: username.text!, password: password.text!)
            }
            
        }
    }
    
    private func isRequiredFieldFilled() -> Bool {
        let usernameValue = self.username.text
        let passwordValue = self.password.text
        
        if usernameValue == "" {
            self.username.setRequired()
        }
        
        if passwordValue == "" {
            self.password.setRequired()
        }
        
        guard usernameValue != "" && passwordValue != "" else {
            self.showAlert(title: "Required fields!", message: "Please provide username and password", icon: .custom(UIImage(systemName: "exclamationmark.circle.fill")!), textColor: .shRed)
            return false
        }
        
        return true
    }
}

extension LoginViewController: LoginViewModelDelegate {
    func successfulLogin(superhero: Superhero) {
        let vc = DrawerRootViewController()
        self.navigationController?.navigationBar.window?.rootViewController = vc
    }
    
    func failedLogin(errorMessage: String) {
        dismissAlert()
        self.showAlert(title: "Login Failed!", message: errorMessage, icon: .error)
    }
    
   
}
