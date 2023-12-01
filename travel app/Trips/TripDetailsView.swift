//
//  TripDetailsView.swift
//  travel app
//
//  Created by Chhoryi_Ling_Nin on 20/11/23.
//

import SwiftUI

struct TripDetailsView: View {
    
    //changed [Trip] -> Trip
    @Binding var tripSource: Trip
    @State private var locationSource: [Location] = []
    
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    var body: some View {
        List {
            VStack (alignment: .leading){
                Text("**Trip name:** \(tripSource.name)")
                Text("**Start date:** \(tripSource.startDate)")
                Text("**End date:** \(tripSource.endDate)")
            }
            
            NavigationLink {
                //temporarily commenting this
                //ItineraryView(tripName: [$tripSource], locationSource: $locationSource)
                ItineraryView(trip: $tripSource, selectedDay: 1)
            } label: {
                Text("Itinerary")
            }
            
            NavigationLink {
                PackingListView(packingList: $tripSource.packingList)
                    .navigationTitle("Packing List")
            } label: {
                Text("Packing list")
            }
        }
        //     .listStyle(PlainListStyle())
        
        
        //Text("Photolog")
        //  .font(.largeTitle)
        
        
    }
}

struct TripDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TripDetailsView(tripSource: .constant(Trip(name: "fake trip", startDate: "", endDate: "", noOfDays: 1)))
    }
}

