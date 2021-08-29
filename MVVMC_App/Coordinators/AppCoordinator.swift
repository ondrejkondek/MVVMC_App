//
//  AppCoordinator.swift
//  MVVMC_App
//
//  Created by Ondrej Kondek on 26/08/2021.
//

import UIKit

class AppCoordinator: Coordinator {
    // MARK: - Properties

    let window: UIWindow?
    var rootNavigationController: UINavigationController?
    var rootViewController: UIViewController?
    var rootTabBarController = TabBarController()

    var childCoordinators: [Coordinator] = []

    // MARK: - Coordinator

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        guard let window = window else {
            return
        }

        window.rootViewController = rootTabBarController
        window.makeKeyAndVisible()
    }

    func finish() {}
}

extension AppCoordinator {
    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
}
