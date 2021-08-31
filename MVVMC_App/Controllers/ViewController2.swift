//
//  ViewController2.swift
//  MVVMC_App
//
//  Created by Ondrej Kondek on 26/08/2021.
//

import UIKit

class ViewController2: UIViewController {
    var coordinator: TableVCCoordinator?

    var viewModel: InfoViewModel! {
        didSet {
            viewModel.viewDelegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .blue
    }
}

extension ViewController2: InfoViewModelViewDelegate {
    func updateScreen() {}
}
