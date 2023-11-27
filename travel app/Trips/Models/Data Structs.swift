//
//  Data Structs.swift
//  travel app
//
//  Created by Chhoryi_Ling_Nin on 25/11/23.
//
import Foundation

struct Todo: Identifiable {
    let id = UUID()
    var title: String
    var subtitle = ""
    var isCompleted = false
}



