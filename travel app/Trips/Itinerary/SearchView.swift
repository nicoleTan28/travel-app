//
//  SearchView.swift
//  travel app
//
//  Created by T Krobot on 22/11/23.
//

import SwiftUI

struct SearchView: View {
    let names = ["Holly", "Josh", "Rhonda", "Ted"]
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { name in
                     
                        Text(name)
                    
                }
            }
            .navigationTitle("Contacts")
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
    SearchView()
}
