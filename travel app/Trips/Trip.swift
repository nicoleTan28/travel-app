//
//  Trip.swift
//  travel app
//
//  Created by T Krobot on 20/11/23.
//

import Foundation
struct Trip: Identifiable, Codable {
    let id = UUID()
    var name: String
    var startDate:Date = Date()
    var endDate:Date = Date()
    //var departure = Date()
    //var arrival = Date()

}

