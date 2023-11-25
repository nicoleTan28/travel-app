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
    @Binding var tripName: [Trip]
    
 @State var valueFromLocation: [Location] = []

    var body: some View {
        NavigationStack{
            List {
                HStack {
                    Text("Day")
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
                    NewLocationsView(showAddSheet: $showAddSheet, locationSource: $valueFromLocation)
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
            NewLocationsView(tripSource: , locationSource: , showAddSheet: , valueFromLocation: )
        }
    }
}

struct ItineraryView_Previews: PreviewProvider {
    static var previews: some View {
       // ItineraryView(tripName: .constant([]), valueFromLocation: Location(name: "...."))
        ItineraryView(tripName: .constant([]), valueFromLocation: .constant([]))
    }
}
