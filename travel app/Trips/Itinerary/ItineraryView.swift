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
    
    var body: some View {
        NavigationStack{
            List {
                HStack {
                    Text("Day")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                }
                VStack(alignment:.leading){
                    Text("**Destinations**")
                    
                    ForEach(locations){location in
                        Text(location.name)
                    }
                }

            }
            .navigationTitle("Itinerary")
            

        }
        .sheet(isPresented: $showAddSheet) {
            NewLocationsView(showAddSheet: $showAddSheet, trip: $trip, selectedDay: .constant(0))//, locationSource: $locationSource)
        }
    }
}

struct ItineraryView_Previews: PreviewProvider {
    static var previews: some View {
        ItineraryView(trip: .constant(Trip(name: "Fake trip", startDate: "", endDate: "")))
    }
}
