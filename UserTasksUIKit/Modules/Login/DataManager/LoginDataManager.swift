//
//  LoginDataManager.swift
//  UserTasksUIKit
//
//  Created by Apostol, Alexandru on 15/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import Foundation

class LoginDataManager: LoginDataManagerProtocol {
    func getUser(callback: @escaping ([User]) -> Void) {
         URLSession.shared.get(UserEndPoint.userList, type: [User].self) { (result) in
                   switch result {
                   case .success(let users):
                       callback(users!)
                   case .failure(let error):
                       print(error)
                   }
               }
    }
    
    deinit {
        print("About To be deinited")
    }
}
