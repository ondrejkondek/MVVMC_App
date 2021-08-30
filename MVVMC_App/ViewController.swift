//
//  ViewController.swift
//  MVVMC_App
//
//  Created by Ondrej Kondek on 26/08/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var myView: UIView!

    var coordinator: AnotherCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        myView.backgroundColor = .red
    }

    @IBAction func tappedButton(_: Any) {
        coordinator?.addView()
    }
}
