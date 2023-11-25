//
//  TripsView.swift
//  travel app
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI

struct TripsView: View {
    
    @State private var showAddSheet = false
  //  @State var trips = [Trip(name: "Trip 1", startDate: Date.now, endDate: Date.now]
    @ObservedObject var trip: Trip = Trip(name: "", startDate: Date(), endDate: Date())
    @Binding var tripSource: [Trip]
    @Binding var locationSource: [Location]

    
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    var body: some View {
        NavigationStack {
            List(){
                NavigationLink{
                    TripDetailsView(tripSource: $tripSource, locationSource: $locationSource)
                        .navigationTitle($trip.name)
                } label:{
                    VStack(){
                        Text("**Name:** \(trip.name)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("**Start Date:** \(trip.startDate, formatter: dateFormatter)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("**End Date:** \(trip.startDate, formatter: dateFormatter)")
                            .frame(maxWidth: .infinity, alignment: .leading)
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
                        Label("New candidate", systemImage: "plus")
                    }
                }
                
                
                
            }
        }
        
        .sheet(isPresented: $showAddSheet) {
            NewTripsView(tripSource: $tripSource, isPresented: $showAddSheet)
                .presentationDetents([.large])
        }
        
    }
}

struct TripsView_Previews: PreviewProvider {
    static var previews: some View {
        TripsView(tripSource: .constant([]), locationSource: .constant([]))
    }
}
