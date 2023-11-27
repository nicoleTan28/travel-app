//
//  ContentView.swift
//  travel app
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @Binding var tripSource: [Trip]
    @Binding var locationSource: [Location]
    @State private var likedPlaces: [Attraction] = []

    
    var body: some View {
        VStack {
            TabView {
                HomeView(likedPlaces: $likedPlaces)
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                TripsView()
                    .tabItem {
                        Label("Trips", systemImage: "globe")
                    }
                LocationsView(likedPlaces: $likedPlaces)
                    .tabItem {
                        Label("Locations", systemImage: "location.circle.fill")
                    }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(tripSource: .constant([]), locationSource: .constant([]))
    }
}
