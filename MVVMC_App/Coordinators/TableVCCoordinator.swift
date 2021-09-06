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

    func changedStatusText() {
        rootNavigationController?.popToRootViewController(animated: true)
    }
}

extension TableVCCoordinator: TableViewViewModelCoordinatorDelegate {
    func getMoreInfo(info: Status, vcCaller: UIViewController) {
        let vc = UIStoryboard(name: "vc2", bundle: nil).instantiateViewController(withIdentifier: "VC2") as! ViewController2
        vc.coordinator = self

        vc.viewModel = InfoViewModel(info: info)
        vc.infoViewDelegate = vcCaller as? SendInfoViewDelegate

        rootNavigationController?.pushViewController(vc, animated: true)
    }
}
