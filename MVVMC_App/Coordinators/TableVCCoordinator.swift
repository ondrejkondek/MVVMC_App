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
//    var thisVC: UIViewController?

    func start(root: UIViewController, nav: UINavigationController) {
        rootViewController = root
        rootNavigationController = nav
    }

    func finish() {}
}

extension TableVCCoordinator: TableViewViewModelCoordinatorDelegate {
    func getChangedInfo(info: String) {
        let vc = rootNavigationController?.viewControllers[0] as! TableViewController
        vc.viewModel.updateDataInTable(info: info)
    }

    func getMoreInfo(info: Status, vcCaller _: UIViewController) {
        let vc = UIStoryboard(name: "vc2", bundle: nil).instantiateViewController(withIdentifier: "VC2") as! ViewController2

        let coor = InfoCoordinator()
        coor.parentCoordinator = self
        coor.start(root: rootViewController!, nav: rootNavigationController!)

        let vm = InfoViewModel(info: info)
        vm.coordinatorDelegate = coor
        vc.viewModel = vm
//        vc.infoViewDelegate = vcCaller as? SendInfoViewDelegate

        rootNavigationController?.pushViewController(vc, animated: true)
    }
}
