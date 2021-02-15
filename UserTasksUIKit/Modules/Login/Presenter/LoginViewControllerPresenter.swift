//
//  LoginViewControllerModel.swift
//  UserTasksUIKit
//
//  Created by Apostol, Alexandru on 15/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import Foundation

class LoginViewPresenter: LoginViewControllerPresenterProtocol {
     var dataManager: LoginDataManagerProtocol
    
    init(dataManager: LoginDataManagerProtocol) {
        self.dataManager = dataManager
    }
    
    var loginViewModel: LoginViewControllerModel {
        LoginViewControllerModel(
            title: "Login",
            buttonTitle: "Login",
            usernameHint: "Login",
            passwordHint: "Login")
    }
    
    func login() {
        print("aboutToCAll")
        dataManager.getUser(callback: { (user) in
            print(user)
        })
    }
}
