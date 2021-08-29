//
//  ViewController.swift
//  MVVMC_App
//
//  Created by Ondrej Kondek on 26/08/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var myView: UIView!
//    @IBOutlet var label: UILabel!
//    @IBOutlet var button: UIButton!

    var coordinator: TableVCCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        myView.backgroundColor = .red

        if #available(iOS 14.0, *) {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)

        } else {
            // Fallback on earlier versions
        }

        tabBarController?.tabBar.items?[0].title = "VC 1"
        if #available(iOS 13.0, *) {
            tabBarController?.tabBar.items?[0].image = UIImage(systemName: "book")
        } else {
            // Fallback on earlier versions
        }
        tabBarController?.tabBar.items?[1].title = "VC 2"
        if #available(iOS 13.0, *) {
            tabBarController?.tabBar.items?[1].image = UIImage(systemName: "play")
        } else {
            // Fallback on earlier versions
        }
    }

    @IBAction func tappedButton(_: Any) {
        // push another view
//        coordinator?.addView()

        let vc = UIStoryboard(name: "vc2", bundle: nil).instantiateViewController(withIdentifier: "VC2") as! ViewController2

        vc.title = "Title 123"
        navigationController?.pushViewController(vc, animated: true)
    }
}
