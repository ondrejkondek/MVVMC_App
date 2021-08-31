//
//  TableVCCoordinator.swift
//  MVVMC_App
//
//  Created by Ondrej Kondek on 27/08/2021.
//

import UIKit

class TableVCCoordinator: Coordinator {
    func start() {}

    var rootViewController: UIViewController?
    var rootNavigationController: UINavigationController?

    init() {}

    func start(root: UIViewController, nav: UINavigationController) {
        rootViewController = root
        rootNavigationController = nav
    }

    func finish() {}

    func getMoreInfo(info: Status) {
        let vc = UIStoryboard(name: "vc2", bundle: nil).instantiateViewController(withIdentifier: "VC2") as! ViewController2
        vc.coordinator = self
        // treba ziskat spravne data od viewModel
        vc.viewModel = InfoViewModel(info: info)

        rootNavigationController?.pushViewController(vc, animated: true)
    }
}
