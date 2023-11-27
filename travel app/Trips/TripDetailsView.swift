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
    //changing this binding to state var
    //@Binding var locationSource: [Location]
    
    
    //again i'm not sure what this is for -danin
    //@ObservedObject var trip: Trip = Trip(name: "", startDate: Date(), endDate: Date())


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
        
        // Button("Itinerary"){
        //    print("Itinerary button pressed")
        //}
        //Button("Packing list"){
        //   print("Packing list button pressed")
        //}
        //Text("Photolog")
        //  .font(.largeTitle)
        
        //.navigationTitle("Trip name")
        
        //}
        
        
    }
}

struct TripDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TripDetailsView(tripSource: .constant(Trip(name: "fake trip", startDate: "", endDate: "", noOfDays: 1)))
    }
}

