//
//  DayModel.swift
//  travel app
//
//  Created by Chhoryi_Ling_Nin on 27/11/23.
//

import Foundation

struct Day: Identifiable {
    let id = UUID()
    var selectedDay: Int
    var locations: [Location]
}

