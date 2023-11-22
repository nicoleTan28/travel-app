//
//  NewDayView.swift
//  travel app
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI
import UIKit

struct NewDayView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var startTime = Date()
    @State private var endTime = Date()
    @State private var isAllDay = false
    @State private var selectedDate = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date()) ?? Date()
    @Binding var tripSource: [Trip]
    @Binding var locationSource: [Location]
    @Binding var showAddSheet: Bool
    @State private var showSearch = false
    
    
    var body: some View {
        NavigationView {
            //  Text(".")
            Form {
                Section {
                    Button {
                        NavigationLink(destination: SearchView()) {
                            
                        }
                    } label: {
                        Text("Add location")
                    }
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
                        let timing = Location(startTime: startTime, endTime: endTime)
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
        
    }
}




struct NewDayView_Previews: PreviewProvider {
    static var previews: some View {
        NewDayView(tripSource: .constant([]), locationSource: .constant([]), showAddSheet: .constant(false))
    }
}
