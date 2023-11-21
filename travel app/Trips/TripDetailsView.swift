//
//  TripDetailsView.swift
//  travel app
//
//  Created by Chhoryi_Ling_Nin on 20/11/23.
//

import SwiftUI

struct TripDetailsView: View {
    
    
    var body: some View {
            List{
                
                NavigationLink{
                    ItineraryView()
                }label:{
                    Text("Itinerary")

                    }
                    
                NavigationLink{
                    PackingListView()
                        .navigationTitle("Packing List")
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

        
    }
}

struct TripDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TripDetailsView()
    }
}

