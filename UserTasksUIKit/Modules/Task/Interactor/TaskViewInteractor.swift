//
//  Interactor.swift
//  UserTasksUIKit
//
//  Created by Apostol, Alexandru on 17/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import Foundation

class TaskViewInteractor: TaskViewInteractorProtocol {
    var dataManager: TaskViewDataManagerProtocol
    var userId: Int
    
    
    init(userId: Int, dataManager: TaskViewDataManagerProtocol) {
        self.dataManager = dataManager
        self.userId = userId
    }
    
    func getTodos(callback: @escaping ([Todo]) -> Void) {
        dataManager.getTask(userId: userId) { (todos) in
           callback(todos)
        }
    }
}
