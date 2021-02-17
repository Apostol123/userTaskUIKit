//
//  AppCoordinator.swift
//  UserTasksUIKit
//
//  Created by Apostol, Alexandru on 15/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import UIKit

public class AppCoordinator: Coordinator {
    
    public enum AppCoordinatorState {
        case inital
        case willShowLoginFlow
        case didShowLoginFlow
        case willShowTasksFlow(userId:Int?)
    }
    
    let navigator: UINavigationController
    var currentState: AppCoordinatorState
    var currentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController) {
        self.navigator = navigationController
        self.currentState = .inital
    }
    
    func start() {
        loop()
    }
    
    func loop() {
        currentState = next(currentState)
        switch currentState {
        case .willShowLoginFlow:
            goToLoginFlow()
        case .willShowTasksFlow(let userId):
            goToTaskFlow(userId: userId)
        case .didShowLoginFlow,.inital:
            fatalError("Unexpected cases in App Coordinator")
        }
    }

    func next(_ state: AppCoordinatorState) -> AppCoordinatorState {
        switch state {
        case .inital:
            return .willShowLoginFlow
        case .didShowLoginFlow:
            return .willShowTasksFlow(userId: nil)
        case .willShowLoginFlow, .willShowTasksFlow:
        return state
        }
    }
    
    func goToLoginFlow() {
        let loginViewController = LoginViewBuilder(coordinatorOtput: { [weak self] output in
            switch output {
            case .task(let userId):
                self?.currentState = .willShowTasksFlow(userId: userId)
                self?.loop()
            
            }
            
        }).build()
        navigator.pushViewController(loginViewController, animated: true)
    }
    
    func goToTaskFlow(userId: Int?) {
        guard let userId = userId else { return}
        let view = TaskViewBuilder(userId: userId).build()
        navigator.pushViewController(view, animated: true)
    }
}
