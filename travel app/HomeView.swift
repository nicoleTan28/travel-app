//
//  HomeView.swift
//  travel app
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI
import MapKit

//calculate distance from current location to closest attraction

struct HomeView: View {
    @State var places: [Attraction] = []
    @Binding var likedPlaces : [Attraction]
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                Text("Recommended Areas")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                .bold()
            }
            Map(){
                ForEach(places, id: \.self) { place in
                    Marker(place.pageTitle, coordinate: CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longtitude))
                }
                
                
            }
            .frame(width:2500, height:230)
            Text("Favourite places")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .bold()
            
//            List {
//                ForEach(likedPlaces){ likedPlace in
//                    Text(String(likedPlace.pageTitle))
//                }
//            }
            
            
                List{
                    ForEach(likedPlaces){ likedPlace in
                        Text(likedPlace.pageTitle)
                    }
                }
            
                    
                .navigationTitle("Home")
            }
            
            
        .onAppear() {
            places = loadJson(filename: "editedJSON") ?? []
            print(places)
        }
       
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(places: [], likedPlaces: .constant([Attraction(pageTitle: "fake", latitude: 2.0, longtitude: 2.0)]))
    }
}
