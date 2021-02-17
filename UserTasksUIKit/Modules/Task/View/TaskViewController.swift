//
//  TaskViewController.swift
//  UserTasksUIKit
//
//  Created by Apostol, Alexandru on 17/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController {
    var presenter: TaskViewPresenterProtocol
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        presenter.viewDidLoad()
    }
    
    init(presenter: TaskViewPresenterProtocol) {
         self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TaskViewController: TaskViewControllerProtocol {
    func showTodos(todo: [Todo]) {
        print(todo)
    }
}
