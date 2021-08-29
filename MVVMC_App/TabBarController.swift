//
//  TabBarController.swift
//  MVVMC_App
//
//  Created by Ondrej Kondek on 27/08/2021.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboard = UIStoryboard(name: "vc2", bundle: nil)
        let vc2 = storyboard.instantiateViewController(withIdentifier: "VC2")

        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC1") as! ViewController
        let navVC = UINavigationController(rootViewController: vc)

        viewControllers = [navVC, vc2]
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
