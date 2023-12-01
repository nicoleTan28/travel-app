//
//  LocationsView.swift
//  travel app
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI
import MapKit

//ON SATURDAY - CALCULATE DISTANCE TO CLOSEST ATTRACTION FROM CURRENT LOCATION

@available(iOS 17.0, *)
struct HomeView: View {
    
    let fileName = "editedJSON"
    //@State private var locationService = LocationService(completer: .init())
    @State private var position = MapCameraPosition.automatic
    @State private var isSheetPresented: Bool = false
    @State private var isMarkerVisible = true
    @State private var search: String = ""
    
    @Binding var likedPlaces: [Attraction]
    @State var places: [Attraction] = []
    
    
    var body: some View {
        NavigationStack {
            
            VStack(alignment: .leading){
                Map(position: $position)
                    .frame(width: 350, height: 250)
                    .padding()
                
                Text("Locations")
                    .font(.title)
                    .bold()
                    .padding()
                
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search for a place", text: $search)
                        .autocorrectionDisabled()
                }
                .padding()
                
                List {
                    ForEach(searchResults, id: \.self) { name in
                        NavigationLink {
                            DetailsView(place: name, likedPlaces: $likedPlaces)
                        } label: {
                            Text(name.pageTitle)
                        }
                    }
                    .listRowBackground(Color.clear)

                }
                .scrollContentBackground(.hidden)
                .listStyle(.plain)
                

                
            }
            .navigationTitle("Home")
            
            
        }
        .onAppear {
            if let placesJSON = loadJson(filename: fileName) {
                for place in placesJSON {
                    //conditional to avoid appending the place again
                    if !places.contains(where: {$0.pageTitle == place.pageTitle}){
                        places.append(place)
                    }
                }
            }
        }
    }
    
    
    
    var searchResults: [Attraction] {
        if search.isEmpty{
            return places
        }else{
            return places.filter { $0.pageTitle.contains(search) }
        }
    }
    
    
}


#Preview {
    HomeView(likedPlaces: .constant([Attraction(pageTitle: "fake", latitude: 1.0, longtitude: 2.0)]))
}
