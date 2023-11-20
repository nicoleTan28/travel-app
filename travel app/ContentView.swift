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
                        Label("Locations", systemImage: "tray.and.arrow.down.fill")
                    }
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "tray.and.arrow.up.fill")
                    }
                TripsView()
                    .tabItem {
                        Label("Trips", systemImage: "person.crop.circle.fill")
                    }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
