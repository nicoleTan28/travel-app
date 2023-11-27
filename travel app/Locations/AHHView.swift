//
//  SearchView.swift
//  travel app
//
//  Created by T Krobot on 22/11/23.
//

import SwiftUI

struct AHHView: View {
    
    let fileName = "editedJSON"
    
    @Environment(\.dismiss) var dismiss
//    @State var names: [String] = []
    @State var places: [Attraction] = []
    @State private var searchText = ""
    @State private var selectedIndex: Int?
    @Binding var locationName : String

    //again i don't know what this location source is for - danin
    //@Binding var locationSource: [Location]
    //what is the value from sheet for?
    //@Binding var valueFromSheet: String?
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(searchResults, id: \.self) { place in
                        NavigationLink {
                            DetailsView(place: place)
                        } label: {
                            Text(place.pageTitle)
                            //                            .onTapGesture {
                            //                                locationName = name
                            //                            }
                        }
                    }
                }
                .navigationTitle("Locations")
            }
            .onAppear {
                if let places = loadJson(filename: fileName) {
//                    for place in places {
//                        names.append(place.pageTitle)
//                    }
                    self.places = places
                }
//                print(names)
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
    AHHView(locationName: .constant("Fake location"))//(locationSource: .constant([]))//, valueFromSheet: .constant(nil))
}
