//
//  TableVCCoordinator.swift
//  MVVMC_App
//
//  Created by Ondrej Kondek on 27/08/2021.
//

import UIKit

class TableVCCoordinator: Coordinator {
    var rootViewController: UIViewController?
    var rootNavigationController: UINavigationController?
    let storyboard = UIStoryboard(name: "Main", bundle: nil)

    init(navControll: UINavigationController) {
        rootNavigationController = navControll
    }

    func start() {
        let vc = storyboard.instantiateViewController(withIdentifier: "VC1") as! ViewController
        vc.coordinator = self
        rootNavigationController?.pushViewController(vc, animated: true)
    }

    func finish() {}

    func addView() {
        let vc = storyboard.instantiateViewController(withIdentifier: "VC2") as! ViewController2
        vc.coordinator = self
        rootNavigationController?.pushViewController(vc, animated: true)
    }
}
