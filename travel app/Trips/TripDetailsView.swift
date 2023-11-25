//
//  TripDetailsView.swift
//  travel app
//
//  Created by Chhoryi_Ling_Nin on 20/11/23.
//

import SwiftUI

struct TripDetailsView: View {
    
    @Binding var tripSource: [Trip]
    @Binding var locationSource: [Location]
    @ObservedObject var trip: Trip = Trip(name: "", startDate: Date(), endDate: Date())


    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    var body: some View {
        List {
            ForEach([trip], id: \.id) { trip in
                VStack {
                    Text("**Trip name:** \(trip.name)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("**Start date:** \(trip.startDate, formatter: dateFormatter)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("**End date:** \(trip.endDate, formatter: dateFormatter)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            
            
            
            NavigationLink {
                ItineraryView(tripName: $tripSource, locationSource: $locationSource)
            } label: {
                Text("Itinerary")
            }
            
            NavigationLink(destination: PackingListView().navigationTitle("Packing List")) {
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
        TripDetailsView(tripSource: .constant([]), locationSource: .constant([]))
    }
}

