//
//  TaskViewPresenter.swift
//  UserTasksUIKit
//
//  Created by Apostol, Alexandru on 17/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import Foundation

class TaskViewPresenter: TaskViewPresenterProtocol {
    var interactor: TaskViewInteractorProtocol
    weak var view: TaskViewControllerProtocol?
    var todo = [Todo]()
    
    
    init(interactor: TaskViewInteractorProtocol) {
        self.interactor = interactor
        
    }
    
    func viewDidLoad() {
        interactor.getTodos { (todo) in
            self.view?.showTodos(todo: todo)
        }
    }
}

