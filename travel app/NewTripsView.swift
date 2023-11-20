//
//  NewTripsView.swift
//  travel app
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI

struct NewTripsView: View {
    
    @State private var name = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    
    var body: some View {
        VStack {
        NavigationView {
            Text(".")
                .navigationTitle("Navigation Title")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button("Add") {
                            print("pressed")
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading){
                        Button("Cancel") {
                            print("Pressed")
                        }
                    }
                }
        }
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

                
            }

            
            
        }
    }
}
struct NewTripsView_Previews: PreviewProvider {
    static var previews: some View {
        NewTripsView()
    }
}
