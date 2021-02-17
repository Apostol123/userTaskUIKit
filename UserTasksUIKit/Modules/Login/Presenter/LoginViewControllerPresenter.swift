//
//  LoginViewControllerModel.swift
//  UserTasksUIKit
//
//  Created by Apostol, Alexandru on 15/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import Foundation

class LoginViewPresenter: LoginViewControllerPresenterProtocol {
  
    weak var view: LoginViewProtocol?
    var dataManager: LoginDataManagerProtocol
    var coordinatorOutPut: (LoginViewOutput) -> Void
    
    init(dataManager: LoginDataManagerProtocol,coordinatorOutput:@escaping(LoginViewOutput)->Void) {
        self.dataManager = dataManager
        self.coordinatorOutPut = coordinatorOutput
    }
    
    var loginViewModel: LoginViewControllerModel {
        LoginViewControllerModel(
            title: "User Taks",
            buttonTitle: "Login",
            usernameHint: "Username",
            passwordHint: "Password")
    }
    
    func login(username: String, password: String)  {
        print("aboutToCAll")
        
        dataManager.getUser(callback: { (user) in
            if   let user = user.first(where: {$0.name == username && $0.username == password}) {
                self.coordinatorOutPut(.task(userId: user.id))
            } else {
                self.view?.showAlert()
            }
        })
       
    }
}
