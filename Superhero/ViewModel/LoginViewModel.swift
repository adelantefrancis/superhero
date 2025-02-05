//
//  LoginViewModel.swift
//  Superhero
//
//  Created by Francis Adelante on 2/5/25.
//

import UIKit
protocol LoginViewModelDelegate {
    func successfulLogin(superhero: Superhero)
    func failedLogin(errorMessage: String )
}

class LoginViewModel: MainViewModel {
    var delegate: LoginViewModelDelegate!
    func processLogin(username:String, password:String) {
        
        let heroes = fetchPlistHeroes(name: "Users")
        guard heroes != nil else {
            delegate.failedLogin(errorMessage: "Incorrect username or password.")
            return
        }
        let search = heroes!.filter { $0.Alias.lowercased() == username.lowercased()}
        guard search.count > 0 else{
            delegate.failedLogin(errorMessage: "Incorrect username or password.")
            return
        }
        
        saveToUserDefaults(model: search[0], key: .heroInSession)
        delegate.successfulLogin(superhero: search[0])
    }
}
