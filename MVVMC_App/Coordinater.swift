//
//  Coordinater.swift
//  MVVMC_App
//
//  Created by Ondrej Kondek on 26/08/2021.
//

import UIKit

protocol Coordinator {
//    var childCoordinators: [Coordinator]? { get set }
    var rootNavigationController: UINavigationController? { get set }
    var rootViewController: UIViewController? { get set }

    func start()

    func finish()

//    func addChildCoordinator(_ coordinator: Coordinator)
//        childCoordinators.append(coordinator)
//    }

//    func removeChildCoordinator(_ coordinator: Coordinator)
//        if let index = childCoordinators.firstIndex(of: coordinator) {
//            childCoordinators.remove(at: index)
//        } else {
//            print("Couldn't remove coordinator: \(coordinator). It's not a child coordinator.")
//        }
//    }

//    func removeAllChildCoordinatorsWith<T>(type _: T.Type)
//        childCoordinators = childCoordinators.filter { $0 is T == false }
//    }

//    func removeAllChildCoordinators()
//        childCoordinators.removeAll()
//    }
}
