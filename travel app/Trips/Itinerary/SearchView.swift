//
//  SearchView.swift
//  travel app
//
//  Created by T Krobot on 22/11/23.
//

import SwiftUI

struct SearchView: View {
    let fileName = "sample3"
    @State var names: [String] = []
    @State private var searchText = ""
    @Environment(\.dismiss) var dismiss
    @Binding var locationSource: [Location]
    @State var location = Location(name: "")
    @State private var selectedIndex: Int?
    @Binding var valueFromSheet: String?
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(names.sorted(), id: \.self) { name in
                        Text(name)
                            .onTapGesture {
                                if let index = names.firstIndex(of: name) { //finds index of tapped name
                                    selectedIndex = index //sets selectedIndex to said index
                                    locationSource.append(Location(name: name)) //adding to a 'list'
                                    dismiss()
                                    valueFromSheet = name //tapped name
                                }
                            }
                    }
                }
                .navigationTitle("Locations")
            }
            .onAppear{
                if let places = loadJson(filename: fileName) {
                    for place in places {
                        names.append(place.name)
                    }
                }
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
    SearchView(locationSource: .constant([]), valueFromSheet: .constant(nil))
}
