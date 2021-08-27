//
//  ViewController.swift
//  MVVMC_App
//
//  Created by Ondrej Kondek on 26/08/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var myView: UIView!
    @IBOutlet var label: UILabel!
    @IBOutlet var button: UIButton!

    var coordinator: TableVCCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

//        coordinator = TableVCCoordinator(navControll: navigationController!)
        myView.backgroundColor = .red

        if #available(iOS 14.0, *) {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
            navigationItem.title = "Title 123"
        } else {
            // Fallback on earlier versions
        }
    }

    @IBAction func tappedButton(_: Any) {
        // push another view
        coordinator?.addView()
    }
}
