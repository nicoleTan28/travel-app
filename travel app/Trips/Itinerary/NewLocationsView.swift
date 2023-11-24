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
    @State private var startTime = Date()
    @State private var endTime = Date()
    @State private var isAllDay = false
    @State private var selectedDate = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date()) ?? Date()
    @Binding var tripSource: [Trip]
    @Binding var locationSource: [Location]
    @Binding var showAddSheet: Bool
    @State private var showSearch = false
    @State var locations = [Location(name: "Location 1")]

    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Button {
                        showSearch = true
                    } label: {
                        Text("Add location")
                    }
                    
                    Text(locations.first?.name ?? "No locations")
                    
                }
                
                Section("Time") {
                    Toggle("All Day", isOn: $isAllDay)
                    
                    DatePicker("Start", selection: isAllDay ? $selectedDate : $startTime, displayedComponents: .hourAndMinute)
                        .disabled(isAllDay ? true : false)
                        .foregroundColor(isAllDay ? .gray : .black)
                    DatePicker("End", selection: isAllDay ? $selectedDate : $endTime, displayedComponents: .hourAndMinute)
                        .disabled(isAllDay ? true : false)
                        .foregroundColor(isAllDay ? .gray : .black)
                    
                }
                
                Section {
                    Button("Save", role: .none) {
                        // code to save the todo
                        let timing = Location(name: ".", startTime: startTime, endTime: endTime)
                        locationSource.append(timing)
                        dismiss()
                        showAddSheet = false
                    }
                    Button("Cancel", role: .destructive) {
                        // code to cancel
                        dismiss()
                        showAddSheet = false
                    }
                }
            }
            .navigationTitle("New location")
            
        }
        .sheet(isPresented: $showSearch) {
            SearchView(locationSource: .constant([]))
        }
        
    }
}




struct NewLocationsView_Previews: PreviewProvider {
    static var previews: some View {
        NewLocationsView(tripSource: .constant([]), locationSource: .constant([]), showAddSheet: .constant(false))
    }
}
