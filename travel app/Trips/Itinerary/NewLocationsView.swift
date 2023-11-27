//
//  NewDayView.swift
//  travel app
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI
import UIKit

struct NewLocationsView: View {
    
      @Environment(\.dismiss) var dismiss
      @State private var isAllDay = false
      @State private var showSearch = false
      @Binding var showAddSheet: Bool
//    
////    @State var locations = [Location(name: "Location 1")]
//    @State private var valueFromSheet: String?
////    @State private var location = Location(name: "")
////    @State private var selectedIndex: Location?
////    @Binding var tripSource: [Trip]
 //     @Binding var locationSource: [Location]
//    @Binding var valueFromLocation: Location
    @State var location: Location = Location(name: "", startTime: Date(), endTime: Date())

    @Binding var trip: Trip
    @Binding var selectedDay: Int
    @State private var locationName = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section("Location") {
                    Button("Search location") {
                        showSearch = true
                    }
//                    .sheet(isPresented: $showSearch, onDismiss: {
//                        
//                    }) {
//                        SearchView()
//                    }
                    Text("**Selected location:** \(locationName)")
                }
                
                Section("Time") {
                    Toggle("All Day", isOn: $isAllDay)
                    
                    DatePicker("Start", selection: $location.startTime, displayedComponents: .hourAndMinute)
                        .disabled(isAllDay ? true : false)
                        .foregroundColor(isAllDay ? .gray : .black)
                    DatePicker("End", selection: $location.endTime, displayedComponents: .hourAndMinute)
                        .disabled(isAllDay ? true : false)
                        .foregroundColor(isAllDay ? .gray : .black)
                }
                
                Section {
                    Button("Save", role: .none) {
                        trip.days[selectedDay].locations.append(Location(name: locationName, startTime: location.startTime, endTime: location.endTime))
                        //no idea what this is so i'm commenting it temporarily - danin
                        //let information = Location(name: location.name, startTime: location.startTime, endTime: location.endTime)
                        //commenting on locationSource??
                        //locationSource.append(Location(name: location.name, startTime: location.startTime, endTime: location.endTime)
                        dismiss()
                    }
                    
                    Button("Cancel", role: .destructive) {
                        dismiss()
                    }
                    
                }
                
            }
        }
        .sheet(isPresented: $showSearch) {
            SearchView(locationName: $locationName)
            //temporarily commenting on this
           // SearchView(locationSource: $locationSource)//, valueFromSheet: .constant(nil))
        }
    }
}





struct NewLocationsView_Previews: PreviewProvider {
    static var previews: some View {
        NewLocationsView(showAddSheet: .constant(false), trip: .constant(Trip(name: "Test", startDate: .now, endDate: .now, days: [])), selectedDay: .constant(0)) // locationSource: .constant([]))
    }
}
