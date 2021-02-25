//
//  LoginViewPortocol.swift
//  UserTasksUIKit
//
//  Created by Apostol, Alexandru on 15/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import UIKit

protocol LoginViewProtocol: class {
    func showDialog(dialogTitle: String, dialogMessage: String)
}

extension LoginViewProtocol where Self: UIViewController {
    func showDialog(dialogTitle: String, dialogMessage: String) {
        let alert = UIAlertController(title: dialogTitle, message: dialogMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert,animated: true)
    }
}
