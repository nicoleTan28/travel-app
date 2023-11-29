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
    var dayDateFormatter = DateFormatter()
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(trip.days, id: \.id) { selectedDay in
                    
                    Section("Day \(selectedDay.selectedDay) - ") {
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
                                HStack {
                                    Text(dateFormatter.string(from: location.startTime))
                                    Text(dateFormatter.string(from: location.endTime))
                                }
                                .font(.caption)
                                
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
            let startDay = trip.startDate
            
            //add one day then convert to string
            dayDateFormatter.dateFormat = "MMM dd, YYYY"
            dateFormatter.dateFormat = "HH:MM"
            
        }
        
            }
}

struct ItineraryView_Previews: PreviewProvider {
    static var previews: some View {
        ItineraryView(trip: .constant(Trip(name: "Fake trip", startDate: "", endDate: "", noOfDays: 3)), selectedDay: 1)
    }
}
