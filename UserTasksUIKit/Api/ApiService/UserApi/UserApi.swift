//
//  UserApi.swift
//  UserTasksUIKit
//
//  Created by Apostol, Alexandru on 15/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import Foundation

enum UserEndPoint {
    case userList
}

extension UserEndPoint: RequestBuilder {
    var urlRequest: URLRequest {
        switch self {
        case .userList:
           guard let url = URL(string: "https://jsonplaceholder.typicode.com/users")
                      else { preconditionFailure("Invalid URL Format") }
                      return URLRequest(url: url)
        }
    }
}
