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

    
    var body: some View {
        VStack {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                TripsView(tripSource: $tripSource, locationSource: $locationSource)
                    .tabItem {
                        Label("Trips", systemImage: "globe")
                    }
                LocationsView()
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
