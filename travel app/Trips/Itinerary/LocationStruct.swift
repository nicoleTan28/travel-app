//
//  Location.swift
//  travel app
//
//  Created by T Krobot on 22/11/23.
//

import Foundation

struct Location: Identifiable, Codable {
    let id = UUID()
    var name: String
    var startTime = Date()
    var endTime = Date()
}

//Danin's json decoding stuff? is it??
func loadJson(filename fileName: String) -> [attract]? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(ResponseData1.self, from: data)
            return jsonData.features
            
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}

struct ResponseData1: Decodable{
    var features: [attract]
}

struct attract: Decodable,Hashable{
    var pageTitle: String
    //var overview: String
   //var attractImage: String?
}
