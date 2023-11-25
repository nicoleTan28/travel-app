//
//  ItineraryView.swift
//  travel app
//
//  Created by Chhoryi_Ling_Nin on 20/11/23.
//

import SwiftUI

struct ItineraryView: View {
    
    @Environment(\.dismiss) var dismiss

    @State  var showAddSheet = false
    @State  var day = 1
    
    @Binding var tripName: [Trip]
    @Binding var valueFromLocation: [Location]

    var body: some View {
        NavigationStack{
            List {
                HStack {
                    Text("Day \(day)")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    Button("+") {
                        showAddSheet.toggle()
                    }
                    .padding()
                    .font(.title)
                    .sheet(isPresented: $showAddSheet, onDismiss: {
                        // Handle any actions when the sheet is dismissed
                    }) {
                        NewLocationsView(tripSource: .constant([]), locationSource: .constant([]), showAddSheet: .constant(false), valueFromLocation: .constant(Location(name: "")))
                    }
                    //                    if let value = valueFromLocation {
                    //                        Text("\(value)")
                    //                    }                    
                    
                    
                }
                ScrollView(.horizontal) {
                    HStack {
                        Text("")
                    }
                    
                }
            }
            .navigationTitle("Itinerary")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $showAddSheet) {
            NewLocationsView(tripSource: .constant([]), locationSource: .constant([]), showAddSheet: .constant(false), valueFromLocation: .constant(Location(name: "")))
        }
    }
}

struct ItineraryView_Previews: PreviewProvider {
    static var previews: some View {
       // ItineraryView(tripName: .constant([]), valueFromLocation: Location(name: "...."))
        ItineraryView(tripName: .constant([]), valueFromLocation: .constant([]))
    }
}
