//
//  List.swift
//  travel app
//
//  Created by T Krobot on 20/11/23.
//

import Foundation

struct List: Identifiable {
    
    var id = UUID()
    var title: String
    var isDone: Bool = false
    
}
