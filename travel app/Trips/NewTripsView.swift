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
                            in: Date()...,
                            displayedComponents: [.date]
                        )
                        
                        
                        DatePicker(
                            "End Date",
                            selection: $endDate,
                            in: startDate...,
                            displayedComponents: [.date]
                        )
                    }
                    
                    
                    Section {
                        Button(role: .none) {
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateStyle = .long
                            
                            let newTrip = Trip(
                                name: name,
                                startDate: dateFormatter.string(from: startDate),
                                endDate: dateFormatter.string(from: endDate),
                                noOfDays: Calendar.current.numberOfDaysBetween(startDate, and: endDate)
                            )
                            tripSource.append(newTrip)
                            dismiss()
                        } label: {
                            Text("Save")
                        }
                        .disabled(name.isEmpty)
                        Button("Cancel", role: .destructive) {
                            // code to cancel
                            dismiss()
                        }
                    }
                    
                }
                .navigationTitle("New trip")
                
            }
            
            
            
            
        }
    }
}


struct NewTripsView_Previews: PreviewProvider {
    static var previews: some View {
        NewTripsView(tripSource: .constant([]), isPresented: .constant(false))
    }
}
