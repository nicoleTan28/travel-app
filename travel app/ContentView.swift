//
//  ContentView.swift
//  travel app
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                LocationsView()
                    .tabItem {
                        Label("Locations", systemImage: "location.circle.fill")
                    }
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                TripsView()
                    .tabItem {
                        Label("Trips", systemImage: "globe")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
