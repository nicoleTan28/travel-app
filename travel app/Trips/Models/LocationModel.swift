//
//  LocationModel.swift
//  travel app
//
//  Created by Chhoryi_Ling_Nin on 27/11/23.
//

import Foundation

struct Location: Identifiable, Codable {
    var id = UUID()
    var name: String
    var startTime: Date
    var endTime: Date

    
    init(name: String, startTime: Date, endTime: Date) {
            self.name = name
            self.startTime = startTime
            self.endTime = endTime

        }
}


