//
//  TripStruct.swift
//  travel app
//
//  Created by Chhoryi_Ling_Nin on 27/11/23.
//

import Foundation

struct Trip: Identifiable, Codable {
    var name: String
    var startDate: String
    var endDate: String
    var noOfDays: Int
    var days: [Day]
    var packingList: [Todo] = []
    
    init(name: String, startDate: String, endDate: String, days: [Day] = [], noOfDays: Int) {
        self.name = name
        self.startDate = startDate
        self.endDate = endDate
        self.days = days
        self.noOfDays = noOfDays
        for i in 1...noOfDays {
            self.days.append(Day(selectedDay: i, locations: []))
        }
    }
    
    var id: String {
        "\(name)\(startDate)\(endDate)\(noOfDays)"
    }
}




