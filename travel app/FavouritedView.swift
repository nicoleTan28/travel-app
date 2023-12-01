//
//  HomeView.swift
//  travel app
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI
import MapKit

//HAVE A MAP TO HIGHLIGHT FAVOURITE LOCATIONS
//LIST 

struct FavouritedView: View {
    @State var places: [Attraction] = []
    @Binding var likedPlaces : [Attraction]
    
    var body: some View {
        NavigationStack{
            
            //CODE FOR ALL MARKERS
//            Map(){
//                ForEach(places, id: \.self) { place in
//                    Marker(place.pageTitle, coordinate: CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longtitude))
//                }
//                
//                
//            }
//            .frame(width:2500, height:230)
            
            Map(){
                ForEach(likedPlaces, id: \.self) { place in
                    Marker(place.pageTitle, coordinate: CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longtitude))
                }
                
                
            }
            .frame(width:2500, height:230)
            
                List{
                    ForEach(likedPlaces){ likedPlace in
                        NavigationLink{
                            DetailsView(place: likedPlace, likedPlaces: $likedPlaces)
                        }label:{
                            Text(likedPlace.pageTitle)
                        }
                    }
                }
            
                    
                .navigationTitle("Favourited")
            }
           
           //CODE FOR ALL MARKERS
//        .onAppear() {
//            places = loadJson(filename: "editedJSON") ?? []
//        }
       
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritedView(places: [], likedPlaces: .constant([Attraction(pageTitle: "fake", overview: "", latitude: 2.0, longtitude: 2.0)]))
    }
}
