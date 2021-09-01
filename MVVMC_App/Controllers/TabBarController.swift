//
//  TabBarController.swift
//  MVVMC_App
//
//  Created by Ondrej Kondek on 27/08/2021.
//

import UIKit

class TabBarController: UITabBarController {
    var navVC1: UIViewController
    var navVC2: UIViewController
    var vc: UIViewController
    init(navVC1 n1: UIViewController, navVC2 n2: UIViewController, vc n3: UIViewController) {
        navVC1 = n1
        navVC2 = n2
        vc = n3
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [navVC1, navVC2, vc]
    }
}
