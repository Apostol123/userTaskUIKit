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
        case willShowTasksFlow
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
        case .didShowLoginFlow,.inital, .willShowTasksFlow:
            fatalError("Unexpected cases in App Coordinator")
        }
    }

    func next(_ state: AppCoordinatorState) -> AppCoordinatorState {
        switch state {
        case .inital:
            return .willShowLoginFlow
        case .didShowLoginFlow:
            return .willShowTasksFlow
        case .willShowLoginFlow, .willShowTasksFlow:
        return state
        }
    }
    
    func goToLoginFlow() {
        let vc = ViewController()
        navigator.pushViewController(vc, animated: true)
    }
}
