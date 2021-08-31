//
//  TableViewController.swift
//  MVVMC_App
//
//  Created by Ondrej Kondek on 27/08/2021.
//

import UIKit

class TableViewController: UITableViewController {
    var coordinator: TableVCCoordinator?
    var viewModel: TableViewViewModel! {
        didSet {
            viewModel.viewDelegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Table Example"
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        setupTapBar()

        title = viewModel.headerText
        viewModel.getSomeExtraPeople()
    }

    // MARK: - Table view data source

    override func numberOfSections(in _: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.numberOfItems()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

        cell.name.text = viewModel.people[indexPath.row].name
        cell.statusText.text = viewModel.people[indexPath.row].about
        let date = viewModel.people[indexPath.row].created
        cell.created.text = viewModel.getStringFromDate(date: date ?? Date())

        return cell
    }

    override func tableView(_: UITableView, didSelectRowAt _: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let status = viewModel.people[indexPath?.row ?? 0]

        coordinator?.getMoreInfo(info: status)
    }
}

extension TableViewController {
    func setupTapBar() {
        tabBarController?.tabBar.items?[0].title = "Table"
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
}

extension TableViewController: TableViewViewModelViewDelegate {
    func updateScreen() {
        tableView.reloadData()
    }
}
