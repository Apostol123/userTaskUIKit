//
//  TaskViewDataManagerProtocol.swift
//  UserTasksUIKit
//
//  Created by Apostol, Alexandru on 17/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import Foundation



protocol TaskViewDataManagerProtocol: class {
    func getTask(userId: Int, callback: @escaping([Todo]) -> Void) 
}
