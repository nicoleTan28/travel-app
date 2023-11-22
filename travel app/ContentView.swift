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
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                TripsView()
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
        ContentView()
    }
}
