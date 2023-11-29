//
//  TripsView.swift
//  travel app
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI
import Forever

struct TripsView: View {
   
    @Forever("trips") var trips: [Trip] = []
    @State private var showAddSheet = false
    @State private var date1 = Date()
    @State private var date2 = Date()
        
    
    var body: some View {
        NavigationStack {
            List($trips, editActions: .all){ $trip in
                NavigationLink{
                    TripDetailsView(tripSource: $trip) 
                        .navigationTitle(trip.name)
                } label:{
                    VStack(alignment:.leading){
                        Text("**Name:** \(trip.name)")
                        Text("**Start Date:** \(trip.startDate)")
                        Text("**End Date:** \(trip.endDate)")
                    }
                    
                }
                
            }
            .navigationTitle("Trips")
            .toolbar {
                ToolbarItem {
                    EditButton()
                }
                ToolbarItem {
                    Button {
                        showAddSheet = true
                    } label: {
                        Label("New trip", systemImage: "plus")
                    }
                }
                
                
                
            }
        }
        
        .sheet(isPresented: $showAddSheet) {
            NewTripsView(tripSource: $trips, isPresented: $showAddSheet)
                .presentationDetents([.large])
        }
        
    }
}

struct TripsView_Previews: PreviewProvider {
    static var previews: some View {
        TripsView(trips: [Trip(name: "aaaaa", startDate: "", endDate: "", noOfDays: 1)])
    }
}
