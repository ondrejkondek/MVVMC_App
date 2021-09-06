//
//  TableVCViewModelProtocols.swift
//  MVVMC_App
//
//  Created by Ondrej Kondek on 31/08/2021.
//

import UIKit

// MARK: this one should be implemented by ViewModel

// Data that view controller needs
// events of VC
protocol TableViewModelType {
    var viewDelegate: TableViewViewModelViewDelegate? { get set }

    // Data Source
    var headerText: String { get }
    func numberOfItems() -> Int

    // Events
    func start()
//    func didSelectRow(_ row: Int, from controller: UIViewController)
//    func didSelectClose(from controller: UIViewController)
}

// MARK: This delegate protocol will let us bubble up any action’s that we can’t handle and must be handled by our coordinator.

// This delegate should be set by the coordinator when it creates each corresponding ViewModel.
protocol TableViewViewModelCoordinatorDelegate {
    func getMoreInfo(info: Status, vcCaller: UIViewController)
}

// MARK: This delegate protocol will let us bubble up any action’s that we can’t handle and must be handled by our coordinator.

// This delegate should be set by the coordinator when it creates each corresponding ViewModel.
protocol TableViewViewModelViewDelegate {
    func updateScreen()

//    func updateState(_ state: ViewControllerState)
}
