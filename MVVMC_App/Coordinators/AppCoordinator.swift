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

    var childCoordinators: [Coordinator] = []

    // MARK: - Coordinator

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        guard let window = window else {
            return
        }

        let childTableCoordinator = TableVCCoordinator()
        let childAnotherCoordinator = AnotherCoordinator()

        let vc1 = UIStoryboard(name: "table", bundle: nil).instantiateViewController(withIdentifier: "table") as! TableViewController
        let navVC1 = UINavigationController(rootViewController: vc1)
        vc1.coordinator = childTableCoordinator

        let vc2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC1") as! ViewController
        let navVC2 = UINavigationController(rootViewController: vc2)
        vc2.coordinator = childAnotherCoordinator

        let tabbar = TabBarController(navVC1: navVC1, navVC2: navVC2)
        window.rootViewController = tabbar
        window.makeKeyAndVisible()

        childTableCoordinator.start(root: tabbar, nav: navVC1)
        addChildCoordinator(childTableCoordinator)
        childAnotherCoordinator.start(root: tabbar, nav: navVC2)
        addChildCoordinator(childTableCoordinator)
    }

    func finish() {}
}

extension AppCoordinator {
    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }

    func removeChildCoordinator(_: Coordinator) {
        childCoordinators.removeLast()
    }
}
