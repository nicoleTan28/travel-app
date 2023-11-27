//
//  ItineraryView.swift
//  travel app
//
//  Created by Chhoryi_Ling_Nin on 20/11/23.
//

import SwiftUI

struct ItineraryView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var showAddSheet = false
    @Binding var trip: Trip
    //commenting on this locationsource because i don't know what it's supposed to do -danin
    //@Binding var locationSource: [Location]
  //  @State var valueFromLocation: [Location] = []
    
    @State private var Locations: [Location] = []
    

    var body: some View {
        NavigationStack{
            List {
                HStack {
                    Text("Day")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    Button {
                        //this button should add a day because that would be clearer
                    }label:{
                        Image(systemName: "plus")
                    }
                    .padding()
                    .font(.title)
                    
                    //why is there a sheet here?
//                    .sheet(isPresented: $showAddSheet, onDismiss: {
//                        
//                    }) {
//                        NewLocationsView(showAddSheet: $showAddSheet)//, locationSource: $locationSource)
//
//                    }
                    //                    if let value = valueFromLocation {
                    //                        Text("\(value)")
                    //                    }                    
                    
                    
                }
                VStack(alignment:.leading) {
                    HStack {
                        Text("**Destinations**")
                        Spacer()
                        Button {
                            showAddSheet.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                        .padding()
                        
                        ForEach(Locations){location in
                            Text(location.name)
                        }
                    }
                }
                //not very pleasing to look at - danin
//                ScrollView(.horizontal) {
//                    VStack(alignment:.leading){
//                        Text("**Destinations**")
//                        HStack {
//                            ForEach(Locations){location in
//                                Text(location.name)
//                            }
//                            
//                        }
//                    }
//                    
//                    
//                }
            }
            .navigationTitle("Itinerary")
            
            //do we really need to add days when there is a fixed number of days in the trip? -> instead we can display the 'built-in' number of days
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button {
//                        
//                    } label: {
//                        Image(systemName: "plus")
//                    }
//                }
//            }
        }
        .sheet(isPresented: $showAddSheet) {
            NewLocationsView(showAddSheet: $showAddSheet, Locations: $Locations)//, locationSource: $locationSource)
        }
    }
}

struct ItineraryView_Previews: PreviewProvider {
    static var previews: some View {
        ItineraryView(trip: .constant(Trip(name: "Fake trip", startDate: Date(), endDate: Date())))//, locationSource: .constant([]))
    }
}
