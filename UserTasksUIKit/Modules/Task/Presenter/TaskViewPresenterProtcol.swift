//
//  TaskViewPresenterProtcol.swift
//  UserTasksUIKit
//
//  Created by Apostol, Alexandru on 17/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import Foundation

public struct TaskViewPresenterModel {
    let section: [TaskViewSection]
}

protocol  TaskViewPresenterProtocol: class {
    func viewDidLoad()
}
