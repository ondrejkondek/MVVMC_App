//
//  MiddleViewController.swift
//  MVVMC_App
//
//  Created by Ondrej Kondek on 30/08/2021.
//

import UIKit

class MiddleViewController: UIViewController {
    var coordinator: MiddleVCCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func next(_: Any) {
        coordinator?.next()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if isMovingFromParent {
            coordinator?.finish()
        }
    }
}
