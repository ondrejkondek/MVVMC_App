//
//  APIViewController.swift
//  MVVMC_App
//
//  Created by Ondrej Kondek on 31/08/2021.
//

import UIKit

class APIViewController: UIViewController {
    var coordinator: APICoordinator?
    var viewModel: APIViewModel! {
        didSet {
            viewModel.viewDelegate = self
        }
    }

    @IBOutlet var yourName: UITextField!
    @IBOutlet var myAge: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func getAge(_: Any) {
        viewModel.apiCall(name: yourName.text ?? "")
    }
}

extension APIViewController: APIViewModelViewDelegate {
    func updateLabel(content: String) {
        DispatchQueue.main.async {
            self.myAge.text = content
        }
    }

    func noInternetAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Unable to fetch data", message: "You entered a wrong name or there is not an internet connection", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style {
                case .default:
                    print("default")

                case .cancel:
                    print("cancel")

                case .destructive:
                    print("destructive")

                @unknown default:
                    print("UNKNOWN")
                }
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
