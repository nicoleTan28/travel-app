//
//  SearchView.swift
//  travel app
//
//  Created by T Krobot on 22/11/23.
//

import SwiftUI

struct SearchView: View {
    
    let names = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "A", "D", "C", "M", "X"]
    @State private var searchText = ""
    @Environment(\.dismiss) var dismiss
    @Binding var locationSource: [Location]
    @State var location = Location(name: "")
    @State private var selectedIndex: Int?
    @Binding var valueFromSheet: String?
    
    var body: some View {
        NavigationStack {
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
