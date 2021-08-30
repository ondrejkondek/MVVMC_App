//
//  AnotherCoordinator.swift
//  MVVMC_App
//
//  Created by Ondrej Kondek on 30/08/2021.
//

import UIKit

class AnotherCoordinator: Coordinator {
    var rootNavigationController: UINavigationController?
    var rootViewController: UIViewController?
    var childCoordinators: [Coordinator] = []

    func start() {}

    func start(root: UIViewController, nav: UINavigationController) {
        rootViewController = root
        rootNavigationController = nav
    }

    func addView() {
        let vc = UIStoryboard(name: "middle", bundle: nil).instantiateViewController(withIdentifier: "middle") as! MiddleViewController
        let coor = MiddleVCCoordinator()
        coor.parentCoordinator = self
        vc.coordinator = coor

        coor.start(root: rootViewController!, nav: rootNavigationController!)
        rootNavigationController?.pushViewController(vc, animated: true)
        addChildCoordinator(coor)
    }

    func finish() {}
}

extension AnotherCoordinator {
    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }

    func removeChildCoordinators() {
        childCoordinators.removeAll()
    }
}
