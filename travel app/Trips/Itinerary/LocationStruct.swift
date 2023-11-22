//
//  Location.swift
//  travel app
//
//  Created by T Krobot on 22/11/23.
//

import Foundation

struct Location: Identifiable, Codable {
    let id = UUID()
    var startTime = Date()
    var endTime = Date()
}
