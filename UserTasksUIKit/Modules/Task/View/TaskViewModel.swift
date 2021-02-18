//
//  TaskViewModel.swift
//  UserTasksUIKit
//
//  Created by Apostol, Alexandru on 18/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import Foundation

public struct TaskViewModel {
    let todo: Todo
    
    var title: String {
        get {
            return todo.title
        }
    }
    
    var completed: Bool {
        get {
            return todo.completed
        }
    }
}
