//
//  TaskViewDataManager.swift
//  UserTasksUIKit
//
//  Created by Apostol, Alexandru on 17/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import UIKit

class TaskViewDataManager: TaskViewDataManagerProtocol {
    func getTask(userId: Int, callback: @escaping ([Todo]) -> Void) {
        URLSession.shared.get(TaskApi.getTaks(userId: userId), type: [Todo].self) { (result) in
            switch result {
            case .success(let tasks):
                if let tasks = tasks {
                callback(tasks)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}
