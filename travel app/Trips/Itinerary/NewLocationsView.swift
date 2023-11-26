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
//    @State private var startTime = Date()
//    @State private var endTime = Date()
      @State private var isAllDay = false
//
//    @State private var selectedDate = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date()) ?? Date()
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

    @ObservedObject var location: Location = Location(name: "", startTime: Date(), endTime: Date())

    
    var body: some View {
        NavigationView {
            Form {
                Section("Location") {
                    Button("Add location") {
                        showSearch = true
                    }
//                    .sheet(isPresented: $showSearch, onDismiss: {
//                        
//                    }) {
//                        SearchView()
//                    }

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
                        
                        //no idea what this is so i'm commenting it temporarily - danin
                        //let information = Location(name: location.name, startTime: location.startTime, endTime: location.endTime)
                        //commenting on locationSource??
                        //locationSource.append(Location(name: location.name, startTime: location.startTime, endTime: location.endTime)
                        dismiss()
                    }
                    
                    Button("Cancel", role: .destructive) {
                        dismiss()
                        showAddSheet = false
                    }
                    
                }
                
            }
        }
        .sheet(isPresented: $showSearch) {
            SearchView()
            //temporarily commenting on this
           // SearchView(locationSource: $locationSource)//, valueFromSheet: .constant(nil))
        }
    }
}





struct NewLocationsView_Previews: PreviewProvider {
    static var previews: some View {
        NewLocationsView(showAddSheet: .constant(false))//, locationSource: .constant([]))
    }
}
