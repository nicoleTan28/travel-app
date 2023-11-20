//
//  ItineraryView.swift
//  travel app
//
//  Created by Chhoryi_Ling_Nin on 20/11/23.
//

import SwiftUI

struct ItineraryView: View {
    
    @State private var showAddSheet = false
    
    var body: some View {
        NavigationStack{
            Text(".")
            HStack {
                Text("Day 1")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            }
            ScrollView(.horizontal) {
                        HStack {
                            ForEach(1..<10) { index in
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.gray)
                                    .frame(width: 200, height: 200)
                                    .id(index)
                            }
                            
                        }
                        .padding()
                    }
            
                .navigationTitle("Itinerary")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showAddSheet = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
        }
        
    }
}

struct ItineraryView_Previews: PreviewProvider {
    static var previews: some View {
        ItineraryView()
    }
}
