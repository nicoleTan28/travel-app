//
//  TripDetailsView.swift
//  travel app
//
//  Created by Chhoryi_Ling_Nin on 20/11/23.
//

import SwiftUI

struct TripDetailsView: View {
    
    //@Binding var tripName: [Trip]
    
    var body: some View {
        NavigationStack{
            List{
                
                NavigationLink{
                    ItineraryView()
                }label:{
                    Text("Itinerary")

                    }
                    
                NavigationLink{
                    PackingListView()
                }label:{
                    Text("Packing list")
                            
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

struct TripDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TripDetailsView()
    }
}

