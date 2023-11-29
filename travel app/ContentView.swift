//
//  ContentView.swift
//  travel app
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI
import Forever

struct ContentView: View {
    
    @Binding var tripSource: [Trip]
    @Binding var locationSource: [Location]
    @State var likedPlaces: [Attraction] = []

    
    var body: some View {
        VStack {
            TabView {
                LocationsView(likedPlaces: $likedPlaces)
                    .tabItem {
                        Label("Home", systemImage: "location.circle.fill")
                    }
                TripsView()
                    .tabItem {
                        Label("Trips", systemImage: "globe")
                    }
                HomeView(likedPlaces: $likedPlaces)
                    .tabItem {
                        Label("Favourited", systemImage: "heart.fill")
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
