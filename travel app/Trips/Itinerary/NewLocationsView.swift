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
      @ObservedObject var location: Location = Location(name: "", startTime: Date(), endTime: Date())

    @Binding var Locations: [Location]
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
                        Locations.append(Location(name: locationName, startTime: location.startTime, endTime: location.endTime))
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
        NewLocationsView(showAddSheet: .constant(false), Locations: .constant([Location(name: "fake location", startTime: Date(), endTime: Date())]))//, locationSource: .constant([]))
    }
}
