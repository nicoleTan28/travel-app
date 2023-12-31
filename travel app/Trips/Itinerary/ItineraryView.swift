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
                        
                        TabView{
                            if selectedDay.locations.isEmpty{
                                Text("No destinations added")
                                    .foregroundStyle(Color.secondary)
                            }
                            ForEach(selectedDay.locations){ location in
                                VStack{
                                    Text(location.name)
                                        .padding()
                                    HStack {
                                        Text(location.startTime.formatted(date: .omitted, time: .shortened))
                                        Text("-")
                                        Text(location.endTime.formatted(date: .omitted, time: .shortened))
                                    }
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                                }
                                .padding()
                                .padding(.bottom)
                                
                            }
                            //}
                        }
                        .frame(height: 150)
                        .tabViewStyle(.page)
                        .listRowBackground(Color.gray.opacity(0.1))
                        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                    }
                    
                }
                .navigationTitle("Itinerary")
                
            }
        }
        .sheet(isPresented: $showAddSheet) {
            NewLocationsView(showAddSheet: $showAddSheet, trip: $trip, selectedDay: $selectedDay)
        }
        
    }
}

struct ItineraryView_Previews: PreviewProvider {
    static var previews: some View {
        ItineraryView(trip: .constant(Trip(name: "Fake trip", startDate: "", endDate: "", noOfDays: 3)), selectedDay: 1)
    }
}
