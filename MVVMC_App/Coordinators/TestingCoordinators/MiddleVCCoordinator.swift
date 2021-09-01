//
//  MiddleVCCoordinator.swift
//  MVVMC_App
//
//  Created by Ondrej Kondek on 30/08/2021.
//

import UIKit

class MiddleVCCoordinator: Coordinator {
    var rootNavigationController: UINavigationController?
    var rootViewController: UIViewController?
    var parentCoordinator: AnotherCoordinator?
    var childCoordinators: [Coordinator] = []

    func start() {}
    func start(root: UIViewController, nav: UINavigationController) {
        rootViewController = root
        rootNavigationController = nav
    }

    func next() {
        let vc = UIStoryboard(name: "finalVC", bundle: nil).instantiateViewController(withIdentifier: "finalVC") as! FinalViewController
        let coor = FinalCoordinator()
        coor.parentCoordinator = self
        vc.coordinator = coor

        coor.start(root: rootViewController!, nav: rootNavigationController!)
        rootNavigationController?.pushViewController(vc, animated: true)
        addChildCoordinator(coor)
    }

    func finish() {
        parentCoordinator?.removeChildCoordinators()
    }
}

extension MiddleVCCoordinator {
    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }

    func removeChildCoordinators() {
        childCoordinators.removeAll()
    }
}
