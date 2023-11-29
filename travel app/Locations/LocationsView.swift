//
//  LocationsView.swift
//  travel app
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI
import MapKit


@available(iOS 17.0, *)
struct LocationsView: View {
    
    let fileName = "editedJSON"
    @State private var locationService = LocationService(completer: .init())
    @State private var showingSheet = false
    @State private var position = MapCameraPosition.automatic
    @State private var isSheetPresented: Bool = false
    @State private var isMarkerVisible = false
    @State private var search: String = ""
    @State private var location: String = ""
    @State private var showingSheetV = false
    
    @Binding var likedPlaces: [Attraction]
    

    var body: some View {
        NavigationStack{
            Map(position: $position)
                .frame(width: 350, height: 250)
                .navigationTitle("Locations")
                
            VStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search for a place", text: $search)
                        .autocorrectionDisabled()
                }
                
                Spacer()
                
                // 2
                List {
                    ForEach(locationService.completions) { completion in
                        Button(action: { }) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(completion.title)
                                    .font(.headline)
                                    .fontDesign(.rounded)
                                Text(completion.subTitle)
                            }
                        }
                        // 3
                        .listRowBackground(Color.clear)
                    }
                }
                // 4
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
            }
            // 5
            .onChange(of: search) {
                locationService.update(queryFragment: search)
            }
            .padding()
            .interactiveDismissDisabled()
            .presentationDetents([.height(200), .large])
            .presentationBackground(.regularMaterial)
            .presentationBackgroundInteraction(.enabled(upThrough: .large))
            
            Button("Show Current Location") {
                showingSheet.toggle()
            }
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .sheet(isPresented: $showingSheet) {
                SwiftUIView()
            }
            Button("Famous Places Details In SIngapore") {
                showingSheetV.toggle()
            }
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .sheet(isPresented: $showingSheetV) {
                AHHView(locationName: .constant("Fake location"), likedPlaces: $likedPlaces)
            }
        }
        
        
    }
    
}

#Preview {
    LocationsView(likedPlaces: .constant([Attraction(pageTitle: "fake", latitude: 1.0, longtitude: 2.0)]))
}
