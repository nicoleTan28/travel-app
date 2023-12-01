//
//  SearchView.swift
//  travel app
//
//  Created by T Krobot on 22/11/23.
//

import SwiftUI

struct LocationsListView: View {
    
    let fileName = "editedJSON"
    
    @Environment(\.dismiss) var dismiss
    @State var places: [Attraction] = []
    @State private var searchText = ""
    @Binding var likedPlaces: [Attraction]
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(searchResults, id: \.self) { place in
                        NavigationLink {
                            DetailsView(place: place, likedPlaces: $likedPlaces)
                        } label: {
                            Text(place.pageTitle)
                        }
                    }
                }
                .navigationTitle("Locations")
            }
           
        }
        .onAppear {
            if let places = loadJson(filename: fileName) {
                self.places = places
            }
        }
        .searchable(text: $searchText)
    }
    
    
    var searchResults: [Attraction] {
        if searchText.isEmpty {
            return places
        } else {
            return places.filter { $0.pageTitle.contains(searchText) }
        }
    }
}

#Preview {
    LocationsListView(likedPlaces: .constant([Attraction(pageTitle: "fake", latitude: 1.0, longtitude: 1.0)]))
}
