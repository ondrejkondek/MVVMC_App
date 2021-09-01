//
//  APIViewModelProtocols.swift
//  MVVMC_App
//
//  Created by Ondrej Kondek on 01/09/2021.
//

import Foundation

protocol APIViewModelViewDelegate {
    func updateLabel(content: String)

    func noInternetAlert()
}
