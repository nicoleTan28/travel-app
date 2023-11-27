//
//  Data Structs.swift
//  travel app
//
//  Created by Chhoryi_Ling_Nin on 25/11/23.
//
import Foundation
import Combine

struct Todo: Identifiable {
    let id = UUID()
    var title: String
    var subtitle = ""
    var isCompleted = false
}


//struct Trip: Identifiable {
//    let id = UUID()
//    var name: String
//    var startDate:Date = Date()
//    var endDate:Date = Date()
//  //  var days: [Day]
//    //var departure = Date()
//    //var arrival = Date()
//
//}

struct Day: Identifiable {
    let id = UUID()
    var count: Int
    var locations: [Location]
}

//struct Location: Identifiable {
//    let id = UUID()
//    var name: String
//    var startTime = Date()
//    var endTime = Date()
//}

//Danin's json decoding stuff? is it??
func loadJson(filename fileName: String) -> [Attraction]? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            
            let jsonData = try decoder.decode(ResponseData1.self, from: data)
            var attractions: [Attraction] = []
            
            for attraction in jsonData.features {
                attractions.append(Attraction(pageTitle: attraction.pageTitle, overview: attraction.overview, latitude: attraction.latitude, longtitude: attraction.longtitude))
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
    var overview: String?
   //var attractImage: String?
    var latitude: Double
    var longtitude: Double
}



class Location: Identifiable {
    var name: String
    var startTime: Date
    var endTime: Date

    
    init(name: String, startTime: Date, endTime: Date) {
            self.name = name
            self.startTime = startTime
            self.endTime = endTime

        }
}


class Trip: Identifiable {
    var name: String
    var startDate: String
    var endDate: String
    var noOfDays: Int
    var days: [Day]
    
    
    init(name: String, startDate: String, endDate: String, days: [Day] = [], noOfDays: Int) {
        self.name = name
        self.startDate = startDate
        self.endDate = endDate
        self.days = days
        self.noOfDays = noOfDays
    }
    
    var id: ObjectIdentifier {
            ObjectIdentifier(self)
        }
}



