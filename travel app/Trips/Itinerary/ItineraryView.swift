//
//  ItineraryView.swift
//  travel app
//
//  Created by Chhoryi_Ling_Nin on 20/11/23.
//

import SwiftUI

struct ItineraryView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var showAddSheet = false
    @Binding var trip: Trip
    //commenting on this locationsource because i don't know what it's supposed to do -danin
    //@Binding var locationSource: [Location]
  //  @State var valueFromLocation: [Location] = []
    
    @State private var locations: [Location] = []
    @State private var dayNumbers: [Int] = []
    @State var selectedDay: Int
    
    var body: some View {
        NavigationStack{
            List {
                ForEach((dayNumbers), id: \.self) {selectedDay in
                    
                    Text("Day \(selectedDay)")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    Button {
                        showAddSheet = true
                    } label: {
                        Text("Destinations")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                    }
                    
                    ForEach(locations){location in
                        Text(location.name)
                    }
                    
                    
                    
                }
                .navigationTitle("Itinerary")
                
            }
        }
        .sheet(isPresented: $showAddSheet) {
            NewLocationsView(showAddSheet: $showAddSheet, trip: $trip, selectedDay: $selectedDay)
        }
        .onAppear{
            for number in 1...trip.noOfDays{
                dayNumbers.append(number)
            }
        }
            }
}

struct ItineraryView_Previews: PreviewProvider {
    static var previews: some View {
        ItineraryView(trip: .constant(Trip(name: "Fake trip", startDate: "", endDate: "", noOfDays: 3)), selectedDay: 1)
    }
}
