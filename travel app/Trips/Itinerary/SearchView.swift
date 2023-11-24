//
//  SearchView.swift
//  travel app
//
//  Created by T Krobot on 22/11/23.
//

import SwiftUI

struct SearchView: View {
    
    let names = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17"]
    @State private var searchText = ""
    @Environment(\.dismiss) var dismiss
    @Binding var locationSource: [Location]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { name in
                    Text(name)
                }
                .onTapGesture {
                    let location = Location()
                    locationSource.append(location)
                    dismiss()
                }
            }
            .navigationTitle("Locations")
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
    SearchView(locationSource: .constant([]))
}
