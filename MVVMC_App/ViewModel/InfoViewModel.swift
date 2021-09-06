//
//  InfoViewModel.swift
//  MVVMC_App
//
//  Created by Ondrej Kondek on 31/08/2021.
//

import Foundation

class InfoViewModel {
    var coordinatorDelegate: InfoViewViewModelCoordinatorDelegate!
    var viewDelegate: InfoViewModelViewDelegate!
    var status: Status!

    init(info: Status) {
        status = info
    }

    func saveNewInfo(info: String) {
        coordinatorDelegate.popToRoot(info: info)
    }
}
