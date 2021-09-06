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
        let childAPICoordinator = APICoordinator()

        let vcs = createVCsForTabBar(childTableCoordinator: childTableCoordinator, childAnotherCoordinator: childAnotherCoordinator, childAPICoordinator: childAPICoordinator)

        let tabbar = TabBarController(navVC1: vcs.0, navVC2: vcs.1, vc: vcs.2)
        window.rootViewController = tabbar
        window.makeKeyAndVisible()

        childTableCoordinator.start(root: tabbar, nav: vcs.0)
        addChildCoordinator(childTableCoordinator)
        childAnotherCoordinator.start(root: tabbar, nav: vcs.1)
        addChildCoordinator(childTableCoordinator)
        childAPICoordinator.start(root: tabbar)
        addChildCoordinator(childAPICoordinator)
    }

    func createVCsForTabBar(childTableCoordinator: TableVCCoordinator, childAnotherCoordinator: AnotherCoordinator, childAPICoordinator: APICoordinator) -> (UINavigationController, UINavigationController, UIViewController) {
        let vc1 = UIStoryboard(name: "table", bundle: nil).instantiateViewController(withIdentifier: "table") as! TableViewController
        let navVC1 = UINavigationController(rootViewController: vc1)
        let vm = TableViewViewModel(persons: [Status(name: "Jack", surname: "John", created: Date(), about: "I am a testing person")])
        vm.coordinatorDelegate = childTableCoordinator
        vc1.viewModel = vm

        let vc2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC1") as! ViewController
        let navVC2 = UINavigationController(rootViewController: vc2)
        vc2.coordinator = childAnotherCoordinator

        let vc = UIStoryboard(name: "API", bundle: nil).instantiateViewController(withIdentifier: "api") as! APIViewController
        vc.coordinator = childAPICoordinator
        vc.viewModel = APIViewModel()

        return (navVC1, navVC2, vc)
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
