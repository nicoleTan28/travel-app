//
//  Attractions.swift
//  travel app
//
//  Created by Chhoryi_Ling_Nin on 27/11/23.
//

import Foundation

func loadJson(filename fileName: String) -> [Attraction]? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            
            let jsonData = try decoder.decode(ResponseData1.self, from: data)
            var attractions: [Attraction] = []
            
            for attraction in jsonData.features {
                attractions.append(Attraction(pageTitle: attraction.pageTitle, overview: attraction.overview ?? "", latitude: attraction.latitude, longtitude: attraction.longtitude))
            }
            return attractions
            
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}

fileprivate struct ResponseData1: Decodable{
    var features: [idLessAttraction]
}

fileprivate struct idLessAttraction: Codable, Hashable {
    var pageTitle: String
    var overview: String?
    //var attractImage: String?
    var latitude: Double
    var longtitude: Double
}

struct Attraction: Identifiable, Codable, Hashable {
    var id = UUID()
    var pageTitle: String
    var overview: String
    //var image: String?
    var latitude: Double
    var longtitude: Double
}


