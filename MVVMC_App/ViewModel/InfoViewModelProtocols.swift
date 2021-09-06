//
//  InfoViewModelProtocols.swift
//  MVVMC_App
//
//  Created by Ondrej Kondek on 31/08/2021.
//

import Foundation

// This delegate should be set by the coordinator when it creates each corresponding ViewModel.
protocol InfoViewModelViewDelegate {
    func updateScreen()
}

protocol InfoViewViewModelCoordinatorDelegate {
    func popToRoot()
}
