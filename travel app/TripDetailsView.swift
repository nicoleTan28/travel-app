//
//  TripDetailsView.swift
//  travel app
//
//  Created by Chhoryi_Ling_Nin on 20/11/23.
//

import SwiftUI

struct TripDetailsView: View {
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink(destination: ItineraryView()) {
                    Text("Itinerary")
                        .padding()
                        .background(.blue)
                        .foregroundStyle(.white)
                }
                    NavigationLink(destination: ItineraryView()) {
                        Text("Packing list")
                            .padding()
                            .background(.blue)
                            .foregroundStyle(.white)
                    }
                }
            
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
            .navigationTitle("Trip name")

        }
    }
}
    #Preview {
        TripDetailsView()
    }
