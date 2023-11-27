//
//  SearchView.swift
//  travel app
//
//  Created by T Krobot on 22/11/23.
//

import SwiftUI

struct SearchView: View {
    
    let fileName = "editedJSON"
    
    @Environment(\.dismiss) var dismiss
    @State var names: [String] = []
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
                    ForEach(searchResults, id: \.self) { name in
                        Text(name)
                            .onTapGesture {
                                locationName = name
                                dismiss()
//                                if let index = names.firstIndex(of: name) {
//                                    selectedIndex = index
//                                    //let valueFromSheet = name
//                                    //locationSource??
//                                    //locationSource.append(Location(name: name, startTime: Date(), endTime: Date()))
//                               //     valueFromSheet = name
//                                    dismiss()
//                                }
                            }
                    }
                }
                .navigationTitle("Locations")
            }
            .onAppear {
                if let places = loadJson(filename: fileName) {
                    for place in places {
                        names.append(place.pageTitle)
                    }
                }
                print(names)
            }
        }
        .searchable(text: $searchText)
    }
    
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { $0.contains(searchText) }
        }
    }
}

#Preview {
    SearchView(locationName: .constant("Fake location"))//(locationSource: .constant([]))//, valueFromSheet: .constant(nil))
}
