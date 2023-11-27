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
    
    var body: some View {
        NavigationStack{
            Text("Recommended Areas")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            Map() {
                ForEach(places, id: \.self) { place in
                    Marker(place.pageTitle, coordinate: CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longtitude))
                }
                //                Marker("Marina Bay Sands", coordinate: mbs)
                //                Marker("Singapore Botanic Gardens", coordinate: sbg)
                //                Marker("Sentosa Island", coordinate: SI)
                //                Marker("Gardens By the Bay", coordinate: GBB)
                //                Marker("Singapore Zoo", coordinate: zoo)
                //                Marker("Orchard Road(Shopping)", coordinate: os)
                //                Marker("Pulau Ubin", coordinate: PU)
            }
            .frame(width:2500, height:230)
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
        HomeView(places: [])
    }
}
