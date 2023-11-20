//
//  Trip.swift
//  travel app
//
//  Created by T Krobot on 20/11/23.
//

import Foundation

struct Trip: Identifiable, Codable {
    
    var id = UUID()
    var name: String
    var startDate = Date()
    var endDate = Date()
}
