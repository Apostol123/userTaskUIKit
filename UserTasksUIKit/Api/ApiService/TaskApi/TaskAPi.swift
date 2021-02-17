//
//  TaskAPi.swift
//  UserTasksUIKit
//
//  Created by Apostol, Alexandru on 17/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import Foundation

enum TaskApi {
    case getTaks(userId: Int)
}


extension TaskApi: RequestBuilder {
    var urlRequest: URLRequest {
        switch self {
        case .getTaks(let userId):
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos?userId=\(userId)") else {
                preconditionFailure("Invalid URL Format")
            }
            return URLRequest(url: url)
        }
    }
}
