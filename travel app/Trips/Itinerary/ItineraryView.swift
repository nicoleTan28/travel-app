//
//  ItineraryView.swift
//  travel app
//
//  Created by Chhoryi_Ling_Nin on 20/11/23.
//

import SwiftUI

struct ItineraryView: View {
    
    @State private var showAddSheet = false
    @Binding var tripName: [Trip]
    @State private var day = 1
    @Environment(\.dismiss) var dismiss


    var body: some View {
        NavigationStack{
      //      Text(".")
            List {
                HStack {
                    Text("Day \(day)")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    Button {
                        showAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .padding()
                    
                }
                ScrollView(.horizontal) {
                    HStack {
//                        ForEach(1..<2) { index in
//                            RoundedRectangle(cornerRadius: 10)
//                                .foregroundColor(.gray)
//                                .frame(width: 200, height: 200)
//                                .id(index)
//                        }
                        
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
            NewLocationView()
        }
    }
}

struct ItineraryView_Previews: PreviewProvider {
    static var previews: some View {
        ItineraryView(tripName: .constant([]))
    }
}
