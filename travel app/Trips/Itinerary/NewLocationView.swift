//
//  NewDayView.swift
//  travel app
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI

struct NewLocationView: View {
    
    @State private var startTime = Date()
    @State private var endTime = Date()
    @State private var isAllDay = false
    
    var body: some View {
        NavigationView {
         //  Text(".")
            Form {
                Section("Time") {
                    Toggle("All Day", isOn: $isAllDay)
                    
                    DatePicker("Start", selection: $startTime, displayedComponents: .hourAndMinute)
                        .disabled(isAllDay ? true : false)
                        .foregroundColor(isAllDay ? .gray : .black)
                    DatePicker("End", selection: $endTime, displayedComponents: .hourAndMinute)
                    
                }
            }
                .navigationTitle("New location")

        }
    }
}

struct NewLocationView_Previews: PreviewProvider {
    static var previews: some View {
        NewLocationView()
    }
}
