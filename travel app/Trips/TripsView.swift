//
//  TripsView.swift
//  travel app
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI

struct TripsView: View {
    
    @State private var showAddSheet = false
    @State private var trips = [Trip(name: "Trip 1", startDate: Date.now),Trip(name: "Trip 2", startDate: Date.now)]
    
    var body: some View {
        NavigationStack {
            List($trips){$trip in
                NavigationLink{
                    TripDetailsView()
                }label:{
                    VStack(){
                        Text("**Trip name:** \(trip.name)")
                        Text("**Start date:** \(trip.startDate)")
                    }
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                }}
            
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
        
//        .sheet(isPresented: $showAddSheet) {
//            NewTripsView(trips: .constant([]))
//                .presentationDetents([.large])
//        }
        .sheet(isPresented: $showAddSheet) {
                    NewTripsView(trips: .constant([]), isPresented: $showAddSheet)
                        .presentationDetents([.large])
                }
        
    }
}
struct TripsView_Previews: PreviewProvider {
    static var previews: some View {
        TripsView()
    }
}
