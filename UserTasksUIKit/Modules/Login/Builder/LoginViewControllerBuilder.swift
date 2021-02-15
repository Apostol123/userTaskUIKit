//
//  LoginViewControllerBuilder.swift
//  UserTasksUIKit
//
//  Created by Apostol, Alexandru on 15/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import UIKit

class LoginViewBuilder: Builder {
    
    func build() -> UIViewController {
        let dataManager = LoginDataManager()
        let presenter = LoginViewPresenter(dataManager: dataManager)
        let view = LoginViewController(presenter: presenter)
        return view
        
    }
}
