//
//  TableViewController.swift
//  MVVMC_App
//
//  Created by Ondrej Kondek on 27/08/2021.
//

import UIKit

class TableViewController: UITableViewController {
    var coordinator: TableVCCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        coordinator = TableVCCoordinator(navControll: navigationController!)
        title = "Table Example"
    }

    // MARK: - Table view data source

    override func numberOfSections(in _: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }

    override func tableView(_: UITableView, didSelectRowAt _: IndexPath) {
        coordinator?.start()
    }
}
