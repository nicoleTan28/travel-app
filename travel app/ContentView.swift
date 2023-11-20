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
                    .badge(2)
                    .tabItem {
                        Label("Received", systemImage: "tray.and.arrow.down.fill")
                    }
                HomeView()
                    .tabItem {
                        Label("Sent", systemImage: "tray.and.arrow.up.fill")
                    }
                TripsView()
                    .badge("!")
                    .tabItem {
                        Label("Account", systemImage: "person.crop.circle.fill")
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
