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
    var overview: String?
   //var attractImage: String?
    var latitude: Double
    var longtitude: Double
}



class Location: ObservableObject, Identifiable {
    @Published var name: String
    @Published var startTime: Date
    @Published var endTime: Date

    
    init(name: String, startTime: Date, endTime: Date) {
            self.name = name
            self.startTime = startTime
            self.endTime = endTime

        }
}


class Trip: ObservableObject, Identifiable {
    @Published var name: String
    @Published var startDate: String
    @Published var endDate: String
    
    
    init(name: String, startDate: String, endDate: String) {
        self.name = name
        self.startDate = startDate
        self.endDate = endDate
    }
    
    var id: ObjectIdentifier {
            ObjectIdentifier(self)
        }
}

extension Calendar {
    func numberOfDaysBetween(_ from: Date, and to: Date) -> Int {
        let fromDate = startOfDay(for: from)
        let toDate = startOfDay(for: to)
        let numberOfDays = dateComponents([.day], from: fromDate, to: toDate)
        
        return numberOfDays.day! + 1 // <1>
    }
}

