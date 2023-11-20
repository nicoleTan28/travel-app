//
//  TripsView.swift
//  travel app
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI

struct TripsView: View {
    
    @State private var showAddSheet = false
    
    var body: some View {
        NavigationStack {
            Text(".")
                .navigationTitle("Trips")
                .toolbar {
                    ToolbarItem {
                        Button {
                            showAddSheet = true
                        } label: {
                            Label("New candidate", systemImage: "plus")
                        }
                    }
                    
                    
                    
                }
        }
        
        .sheet(isPresented: $showAddSheet) {
            NewTripsView(trips: .constant([]))
                .presentationDetents([.large])
        }
        
    }
}
struct TripsView_Previews: PreviewProvider {
    static var previews: some View {
        TripsView()
    }
}
