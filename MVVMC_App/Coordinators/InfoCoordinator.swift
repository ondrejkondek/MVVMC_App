//
//  InfoCoordinator.swift
//  MVVMC_App
//
//  Created by Ondrej Kondek on 06/09/2021.
//

import UIKit

class InfoCoordinator: Coordinator {
    var rootNavigationController: UINavigationController?
    var rootViewController: UIViewController?

    var parentCoordinator: TableVCCoordinator!

    func start() {}

    func start(root: UIViewController, nav: UINavigationController) {
        rootViewController = root
        rootNavigationController = nav
    }

    func finish() {}
}

extension InfoCoordinator: InfoViewViewModelCoordinatorDelegate {
    func popToRoot(info: String) {
        parentCoordinator.getChangedInfo(info: info)
        rootNavigationController?.popToRootViewController(animated: true)
    }
}
