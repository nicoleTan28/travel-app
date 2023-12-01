//
//  ItineraryView.swift
//  travel app
//
//  Created by Chhoryi_Ling_Nin on 20/11/23.
//

import SwiftUI
import Forever

struct ItineraryView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var showAddSheet = false
    @Binding var trip: Trip
    @Forever("locations") var locations: [Location] = []

    @State private var dayNumbers: [Int] = []
    @State var selectedDay: Int
    
    var dateFormatter = DateFormatter()
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(trip.days, id: \.id) { selectedDay in
                    
                    Section("Day \(selectedDay.selectedDay)") {
                        Button {
                            self.selectedDay = selectedDay.selectedDay
                            showAddSheet = true
                        } label: {
                            Text("Add new destination")
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        ForEach(selectedDay.locations){ location in
                            HStack{
                                Text(location.name)
                                Spacer()
                                HStack {
                                    Text(dateFormatter.string(from: location.startTime))
                                    Text("-")
                                    Text(dateFormatter.string(from: location.endTime))
                                }
                                .font(.caption)
                                .foregroundStyle(.gray)
                            }
                            
                        }
                        
                    }
                    
                }
                .navigationTitle("Itinerary")
                
            }
        }
        .sheet(isPresented: $showAddSheet) {
            NewLocationsView(showAddSheet: $showAddSheet, trip: $trip, selectedDay: $selectedDay)
        }
        .onAppear{
    
            dateFormatter.dateFormat = "HH:MM"
            
        }
        
            }
}

struct ItineraryView_Previews: PreviewProvider {
    static var previews: some View {
        ItineraryView(trip: .constant(Trip(name: "Fake trip", startDate: "", endDate: "", noOfDays: 3)), selectedDay: 1)
    }
}
