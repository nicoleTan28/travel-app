//
//  NewTripsView.swift
//  travel app
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI


struct NewTripsView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var tripSource: [Trip]
    @Binding var isPresented: Bool
    @State private var currentDate = Date()
    @State private var name = ""
    @State private var startDate: Date = Date()
    @State private var endDate: Date = Date()
    @State private var flight = ""
    @State private var departure = Date()
    @State private var arrival = Date()
    
    var body: some View {
        VStack {
        NavigationView {
         //  Text(".")
            Form {
                Section("Name") {
                    TextField("Enter Trip Name", text: $name)
                }
                
                Section("Date") {
                    DatePicker(
                        "Start Date",
                                selection: $startDate,
                                displayedComponents: [.date]
                    )
                    DatePicker(
                        "End Date",
                                selection: $endDate,
                                displayedComponents: [.date]
                    )
                }
                
                Section("Flight") {
                    TextField("Enter Flight Number", text: $flight)
                    
                    DatePicker("Departure", selection: $departure, displayedComponents: .hourAndMinute)
                    
                    DatePicker("Arrival", selection: $arrival, displayedComponents: .hourAndMinute)

                }
                Section {
                    Button("Save", role: .none) {
                        // code to save the todo
                        let newTrip = Trip(name: name, startDate: startDate)
                        tripSource.append(newTrip)
                        dismiss()
                        isPresented = false
                    }
                    Button("Cancel", role: .destructive) {
                        // code to cancel
                        dismiss()
                        isPresented = false
                    }
                }
                
            }
                .navigationTitle("New trip")
                
        }


            
            
        }
    }
}
//struct NewTripsView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewTripsView(trips: .constant([]))
//    }
//}

struct NewTripsView_Previews: PreviewProvider {
    static var previews: some View {
        NewTripsView(tripSource: .constant([]), isPresented: .constant(false))
    }
}
