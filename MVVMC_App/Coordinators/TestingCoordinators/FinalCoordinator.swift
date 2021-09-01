//
//  FinalCoordinator.swift
//  MVVMC_App
//
//  Created by Ondrej Kondek on 30/08/2021.
//

import UIKit

class FinalCoordinator: Coordinator {
    var rootNavigationController: UINavigationController?
    var rootViewController: UIViewController?
    var parentCoordinator: MiddleVCCoordinator?

    func start() {}
    func start(root: UIViewController, nav: UINavigationController) {
        rootViewController = root
        rootNavigationController = nav
    }

    func pop() {
        rootNavigationController?.popToRootViewController(animated: true)
        parentCoordinator?.removeChildCoordinators()
        parentCoordinator?.parentCoordinator?.removeChildCoordinators()
    }

    func finish() {
        parentCoordinator?.removeChildCoordinators()
    }
}
