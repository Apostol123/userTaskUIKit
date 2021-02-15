//
//  LoginViewControllerPresenterProtocol.swift
//  UserTasksUIKit
//
//  Created by Apostol, Alexandru on 15/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import Foundation

protocol LoginViewControllerPresenterProtocol: class {
    var loginViewModel: LoginViewControllerModel { get }
    func login()
}
