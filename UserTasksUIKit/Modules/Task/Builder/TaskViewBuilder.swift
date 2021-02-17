//
//  TaskViewBuilder.swift
//  UserTasksUIKit
//
//  Created by Apostol, Alexandru on 17/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import UIKit

class TaskViewBuilder: Builder {
    var userId: Int
    init(userId: Int) {
        self.userId = userId
    }
    func build() -> UIViewController {
        let dataManager = TaskViewDataManager()
        let interactor = TaskViewInteractor(userId: userId, dataManager: dataManager)
        let presenter = TaskViewPresenter(interactor: interactor)
        let view = TaskViewController(presenter: presenter)
        presenter.view = view
        return view
    }
}
