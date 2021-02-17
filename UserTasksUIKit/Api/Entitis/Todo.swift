//
//  Task.swift
//  UserTasksUIKit
//
//  Created by Apostol, Alexandru on 17/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import Foundation

struct Todo: Codable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
}
