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
    @Binding var locationSource: [Location]
  //  @State var valueFromLocation: [Location] = []

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
                        
                    }) {
                        NewLocationsView(showAddSheet: $showAddSheet, locationSource: $locationSource)

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
            NewLocationsView(showAddSheet: $showAddSheet, locationSource: $locationSource)
        }
    }
}

struct ItineraryView_Previews: PreviewProvider {
    static var previews: some View {
        ItineraryView(tripName: .constant([]), locationSource: .constant([]))
    }
}
