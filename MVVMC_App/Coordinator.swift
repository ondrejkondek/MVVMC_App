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
}
