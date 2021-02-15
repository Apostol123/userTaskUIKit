//
//  LoginViewControllerModel.swift
//  UserTasksUIKit
//
//  Created by Apostol, Alexandru on 15/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import Foundation

class LoginViewPresenter: LoginViewControllerPresenterProtocol {
    
    
    
    var loginViewModel: LoginViewControllerModel {
        LoginViewControllerModel(
            title: "Login",
            buttonTitle: "Login",
            usernameHint: "Login",
            passwordHint: "Login")
    }
}
