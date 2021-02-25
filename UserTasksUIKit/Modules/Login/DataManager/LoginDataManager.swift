//
//  LoginDataManager.swift
//  UserTasksUIKit
//
//  Created by Apostol, Alexandru on 15/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import Foundation

class LoginDataManager: LoginDataManagerProtocol {
    func getUser(callback: @escaping (Result<[User], ApiError>) -> Void) {
        URLSession.shared.get(UserEndPoint.userList, type: [User].self) { (result) in
            switch result {
            case .success(let users):
                if let users = users {
                    callback(.success(users))
                }
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
}
