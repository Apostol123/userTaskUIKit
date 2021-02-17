//
//  TaskViewBuilderProtocol.swift
//  UserTasksUIKit
//
//  Created by Apostol, Alexandru on 17/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import Foundation

protocol TaskViewInteractorProtocol: class {
    func getTodos( callback:@escaping ([Todo] )-> Void)
}
