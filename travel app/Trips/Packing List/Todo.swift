//
//  Todo.swift
//  travel app
//
//  Created by T Krobot on 20/11/23.
//

import Foundation

struct Todo: Identifiable {
    
    let id = UUID()
    var title: String
    var subtitle = ""
    var isCompleted = false
}

struct trip: Identifiable{
    
    let id = UUID()
    var name: String
    var start = Date()
    var end = Date()
    
    
}
