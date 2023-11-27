//
//  extensions.swift
//  travel app
//
//  Created by T Krobot on 27/11/23.
//

import Foundation

extension Calendar {
    func numberOfDaysBetween(_ from: Date, and to: Date) -> Int {
        let fromDate = startOfDay(for: from)
        let toDate = startOfDay(for: to)
        let numberOfDays = dateComponents([.day], from: fromDate, to: toDate)
        
        return numberOfDays.day! + 1 // <1>
    }
}
