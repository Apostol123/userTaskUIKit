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
    
    
    init(interactor: TaskViewInteractorProtocol) {
        self.interactor = interactor
        
    }
    
    func viewDidLoad() {
        interactor.getTodos { (todo) in
            self.view?.show(self.layout(todo))
        }
    }
    
    fileprivate func layout(_ input: [Todo]) -> TaskViewPresenterModel {
        var sections = input.map({TaskViewSection.todo(title: $0.title, completed: $0.completed, userID: $0.userId)})
        return TaskViewPresenterModel(section: [
            sections
            ].flatMap({$0}))
    }
    
   
}

enum TaskViewState {
    case todo
}

