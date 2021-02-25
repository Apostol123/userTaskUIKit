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
        dataManager.getUser(callback: { (result) in
            switch result {
            case .success(let users):
                if   let user = users.first(where: {$0.name == username && $0.username == password}) {
                    self.coordinatorOutPut(.task(userId: user.id))
                } else {
                    self.view?.showDialog(dialogTitle: "Registration Error", dialogMessage: "The username of password are wrong")
                }
            case .failure(_):
                self.view?.showDialog(dialogTitle: "There was an unexpted error", dialogMessage: "Please try again later")
            }
            
        })
        
    }
}
