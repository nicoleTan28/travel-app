//
//  HomeView.swift
//  travel app
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI
import MapKit


struct HomeView: View {
    let mbs = CLLocationCoordinate2D(latitude: 1.2836, longitude: 103.8606)
    let sbg = CLLocationCoordinate2D(latitude: 1.3136, longitude: 103.8158)
    let SI = CLLocationCoordinate2D(latitude: 1.2494, longitude: 103.8303)
    let GBB = CLLocationCoordinate2D(latitude: 1.2815, longitude: 103.8633)
    let zoo = CLLocationCoordinate2D(latitude: 1.4043, longitude: 103.7930)
    let os = CLLocationCoordinate2D(latitude: 1.3032, longitude: 103.8344)
    let PU = CLLocationCoordinate2D(latitude: 1.4047, longitude: 103.9609)
    
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
                
                //                for place in places{
                //                    Marker(place.pageTitle, coordinate: CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longtitude))
                //                }
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
                        Text(String(likedPlace.pageTitle))
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
