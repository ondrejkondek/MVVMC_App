//
//  APICoordinator.swift
//  MVVMC_App
//
//  Created by Ondrej Kondek on 31/08/2021.
//

import UIKit

class APICoordinator: Coordinator {
    func start() {}

    var rootViewController: UIViewController?
    var rootNavigationController: UINavigationController?

    init() {}

    func start(root: UIViewController) {
        rootViewController = root
    }

    func finish() {}
}
