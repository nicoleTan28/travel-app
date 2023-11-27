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
    @State var trips: [Trip] = [Trip(name: "", startDate: Date(), endDate: Date())]
    //not sure what this observed object is for
//    @ObservedObject var trip: Trip = Trip(name: "", startDate: Date(), endDate: Date())
    
    //i think these bindings are not needed -> where does it even bind to??
//    @Binding var tripSource: [Trip]
    //@Binding var locationSource: [Location]
    @State private var date1 = Date()
    @State private var date2 = Date()
        
    
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    var body: some View {
        NavigationStack {
            List($trips, editActions: .all){ $trip in
                NavigationLink{
                    TripDetailsView(tripSource: $trip) //locationSource: $locationSource)
                        .navigationTitle(trip.name)
                } label:{
                    VStack(alignment:.leading){
                        Text("**Name:** \(trip.name)")
                        Text("**Start Date:** \(trip.startDate, formatter: dateFormatter)")
                        Text("**End Date:** \(trip.endDate, formatter: dateFormatter)")
                    }
                    
                }
                
            }
            .onAppear{
                //number of days difference
                let diffs = Calendar.current.dateComponents([.day], from: date1, to: date2)
                print(diffs)
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
        TripsView(trips: [Trip(name: "aaaaa", startDate: Date(), endDate: Date())])//, locationSource: .constant([]))
    }
}
