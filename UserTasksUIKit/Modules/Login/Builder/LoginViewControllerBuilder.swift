//
//  LoginViewControllerBuilder.swift
//  UserTasksUIKit
//
//  Created by Apostol, Alexandru on 15/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import UIKit

class LoginViewBuilder: Builder {
    var coordinatorOutput: (LoginViewOutput) -> Void
    init( coordinatorOtput:@escaping(LoginViewOutput)-> Void) {
        self.coordinatorOutput  = coordinatorOtput
    }
    
    func build() -> UIViewController {
        let dataManager = LoginDataManager()
        let presenter = LoginViewPresenter(dataManager: dataManager, coordinatorOutput: coordinatorOutput)
        let view = LoginViewController(presenter: presenter)
        presenter.view = view
        return view
        
    }
}
