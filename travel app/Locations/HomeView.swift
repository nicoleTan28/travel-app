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
    @State private var showingSheet = false
    @State private var position = MapCameraPosition.automatic
    @State private var isSheetPresented: Bool = false
    @State private var isMarkerVisible = false
    @State private var search: String = ""
    @State private var location: String = ""
    @State private var showingSheetV = false
    
    @Binding var likedPlaces: [Attraction]
    @State var places: [Attraction] = []

    
    var body: some View {
        NavigationStack {
            ZStack{
                List {
                    ForEach(searchResults, id: \.self) { name in
                        NavigationLink {
                            DetailsView(place: name, likedPlaces: $likedPlaces)
                        } label: {
                            Text(name.pageTitle)
                        }
                    }
                }
                

                VStack(alignment: .leading){
                    Map(position: $position)
                        .frame(width: 350, height: 250)
                        .padding()
                    
                    Text("Nearby locations")
                        .font(.title)
                        .bold()
                        .padding()
                    Spacer()
                }
                .opacity(search.isEmpty ? 1:0)
                

               
                .navigationTitle("Home")
            }
            .onAppear {
                if let placesJSON = loadJson(filename: fileName) {
                    for place in placesJSON {
                        places.append(place)
                    }
                }
            }
          
        }
        .searchable(text: $search)
    }
    
    
    var searchResults: [Attraction] {
        if search.isEmpty{
            return []
        }else{
            return places.filter { $0.pageTitle.contains(search) }
        }
    }
    
    //        NavigationStack{
    //            VStack(alignment: .leading){
    //                HStack {
    //                    Image(systemName: "magnifyingglass")
    //                    TextField("Search for a place", text: $search)
    //                        .autocorrectionDisabled()
    //                        .padding()
    //                }
    //
    //                Map(position: $position)
    //                    .frame(width: 350, height: 250)
    //
    //                Text("Nearby locations")
    //                    .font(.title)
    //                    .bold()
    //            }
    //            .padding()
    //
    //            Spacer()
    
    
    //            VStack {
    //                HStack {
    //                    Image(systemName: "magnifyingglass")
    //                    TextField("Search for a place", text: $search)
    //                        .autocorrectionDisabled()
    //                }
    //
    //                Spacer()
    //
    //                // 2
    //                List {
    //                    ForEach(locationService.completions) { completion in
    //                        Button(action: { }) {
    //                            VStack(alignment: .leading, spacing: 4) {
    //                                Text(completion.title)
    //                                    .font(.headline)
    //                                    .fontDesign(.rounded)
    //                                Text(completion.subTitle)
    //                            }
    //                        }
    //                        // 3
    //                        .listRowBackground(Color.clear)
    //                    }
    //                }
    //                // 4
    //                .listStyle(.plain)
    //                .scrollContentBackground(.hidden)
    //            }
    //            // 5
    //            .onChange(of: search) {
    //                locationService.update(queryFragment: search)
    //            }
    //            .padding()
    //            .interactiveDismissDisabled()
    //            .presentationDetents([.height(200), .large])
    //            .presentationBackground(.regularMaterial)
    //            .presentationBackgroundInteraction(.enabled(upThrough: .large))
    
    //OLD BUTTONS
    //            Button("Show Current Location") {
    //                showingSheet.toggle()
    //            }
    //            .padding()
    //            .background(.blue)
    //            .cornerRadius(10)
    //            .sheet(isPresented: $showingSheet) {
    //                SwiftUIView()
    //            }
    //            Button("Famous Places Details In SIngapore") {
    //                showingSheetV.toggle()
    //            }
    //            .padding()
    //            .background(.blue)
    //            .cornerRadius(10)
    //            .sheet(isPresented: $showingSheetV) {
    //                LocationsListView(likedPlaces: $likedPlaces)
    //            }
    
}


#Preview {
    HomeView(likedPlaces: .constant([Attraction(pageTitle: "fake", latitude: 1.0, longtitude: 2.0)]))
}
