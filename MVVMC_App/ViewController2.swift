//
//  ViewController2.swift
//  MVVMC_App
//
//  Created by Ondrej Kondek on 26/08/2021.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet var myView: UIView!
    var coordinator: TableVCCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        myView.backgroundColor = .blue
    }
}
