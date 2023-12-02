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
    
    @Binding var showAddSheet: Bool
    @Binding var trip: Trip
    @Binding var selectedDay: Int
    
    @State private var isAllDay = false
    @State private var showSearch = false
    @State var location: Location = Location(name: "", startTime: Date(), endTime: Date())
    @State private var locationName = ""
    @State private var showAlert = false
    
    
    var body: some View {
        NavigationView {
            Form {
                Text("**Selected location:** \(locationName)")

                Section("Location") {
                    Button("Search location") {
                        showSearch = true
                    }
                }
                
                Section("Time") {
                    Toggle("All Day", isOn: $isAllDay)
                    
                    DatePicker("Start", 
                               selection: $location.startTime,
                               displayedComponents: .hourAndMinute)
                        .disabled(isAllDay ? true : false)
                        .foregroundColor(isAllDay ? .gray : .black)
                    DatePicker("End", 
                               selection: $location.endTime,
                               in: location.startTime...,
                               displayedComponents: .hourAndMinute)
                        .disabled(isAllDay ? true : false)
                        .foregroundColor(isAllDay ? .gray : .black)
                }
                
                Section {
                    Button("Save", role: .none) {
                        trip.days[selectedDay-1].locations.append(Location(name: locationName, startTime: location.startTime, endTime: location.endTime))
                        dismiss()
                    }
                    .disabled(locationName.isEmpty)
                    
                    Button("Cancel", role: .destructive) {
                        dismiss()
                    }
                    
                }
                
            }
        }
        .sheet(isPresented: $showSearch) {
            SearchView(locationName: $locationName)
        }
    }
}





struct NewLocationsView_Previews: PreviewProvider {
    static var previews: some View {
        NewLocationsView(showAddSheet: .constant(false), trip: .constant(Trip(name: "Test", startDate: "", endDate: "", days: [], noOfDays: 1)), selectedDay: .constant(0))/*, location: Location(name: "", startTime: Date(), endTime: Date()))*/ // locationSource: .constant([]))
    }
}
