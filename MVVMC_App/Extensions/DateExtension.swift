//
//  DateExtension.swift
//  MVVMC_App
//
//  Created by Ondrej Kondek on 06/09/2021.
//

import Foundation

extension Date {
    func getStringFromDate() -> String {
        let df = DateFormatter()
        df.dateFormat = "YY-MM-dd HH:MM:ss"
        let str = df.string(from: self)
        return "Created at " + str
    }
}
