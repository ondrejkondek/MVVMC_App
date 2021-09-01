//
//  ViewController2.swift
//  MVVMC_App
//
//  Created by Ondrej Kondek on 26/08/2021.
//

import UIKit

class ViewController2: UIViewController {
    var coordinator: TableVCCoordinator?
    // Delegate for testing and sending the info back to rootVC
    var infoViewDelegate: SendInfoViewDelegate?

    @IBOutlet var name: UILabel!
    @IBOutlet var surname: UILabel!
    @IBOutlet var statusText: UITextView!
    @IBOutlet var change: UIButton!
    @IBOutlet var photo: UIImageView!

    var viewModel: InfoViewModel! {
        didSet {
            viewModel.viewDelegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        name.text = viewModel.status.name
        surname.text = viewModel.status.surname
        statusText.text = viewModel.status.about

        photo.layer.cornerRadius = photo.frame.size.width / 2
        photo.clipsToBounds = true
        photo.layer.borderWidth = 3
        if #available(iOS 13.0, *) {
            photo.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        } else {
            // Fallback on earlier versions
        }
        photo.contentMode = .scaleAspectFill
        photo.image = UIImage(named: "profile")
    }

    @IBAction func save(_: Any) {
//        viewModel.status.about = statusText.text
        coordinator?.changedStatusText()
        infoViewDelegate?.changeDescription(info: statusText.text)
    }
}

extension ViewController2: InfoViewModelViewDelegate {
    func updateScreen() {}
}
