//
//  TripsView.swift
//  travel app
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI

struct TripsView: View {
    
    @State private var showAddSheet = false
    @State private var trips = [Trip(name: "Trip 1", startDate: Date.now, endDate: Date.now)]
    
    let dateFormatter: DateFormatter = {
       let formatter = DateFormatter()
       formatter.dateStyle = .medium
       return formatter
    }()
    
    var body: some View {
        NavigationStack {
            List($trips){$trip in
                NavigationLink{
                    TripDetailsView()
                }label:{
                    VStack(){
                        Text("**Trip name:** \(trip.name)")
                        Text("**Start date:** \(trip.startDate,formatter: dateFormatter)")
                        Text("**End date:** \(trip.endDate, formatter: dateFormatter)")
                    }
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
                    NewTripsView(tripSource: $trips, isPresented: $showAddSheet)
                        .presentationDetents([.large])
                }
        
    }
}
struct TripsView_Previews: PreviewProvider {
    static var previews: some View {
        TripsView()
    }
}
