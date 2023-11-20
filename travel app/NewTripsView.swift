//
//  NewTripsView.swift
//  travel app
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI


struct NewTripsView: View {
    
    @Binding var trips: [Trip]
    @Binding var isPresented: Bool
    @State private var currentDate = Date()
    @State private var name = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var flight = ""
    
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
                    DatePicker("Departure", selection: $currentDate, displayedComponents: .hourAndMinute)
                    DatePicker("Arrival", selection: $currentDate, displayedComponents: .hourAndMinute)

                }
                Section {
                    Button("Save", role: .none) {
                        // code to save the todo
                        let newTrip = Trip(name: name, startDate: startDate)
                        trips.append(newTrip)
                        isPresented = false
                    }
                    Button("Cancel", role: .destructive) {
                        // code to cancel
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
        NewTripsView(trips: .constant([]), isPresented: .constant(false))
    }
}
