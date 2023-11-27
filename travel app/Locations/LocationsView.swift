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
    
    @State private var showingSheetM = false
    @State private var showingSheetA = false
    @State private var showingSheetH = false
    @State private var showingSheetN = false
    

    var body: some View {
        NavigationStack{
            Map(position: $position)
                .frame(width: 350, height: 250)
                .navigationTitle("Locations")
            
//            ScrollView(.horizontal, showsIndicators: false) {
//                            HStack {
//                                Button("Nature"){
//                                    showingSheetN.toggle()
//                                }
//                                .sheet(isPresented: $showingSheetN) {
//                                    NView()
//                                }
//                                .padding()
//                                .foregroundColor(.white)
//                                .background(.green)
//                                .cornerRadius(10)
//                                
//                                Spacer()
//                                
//                                Button("Heritage"){
//                                    showingSheetH.toggle()
//                                }
//                                .sheet(isPresented: $showingSheetH) {
//                                    HView()
//                                }
//                                .padding()
//                                .foregroundColor(.white)
//                                .background(.green)
//                                .cornerRadius(10)
//                                Button("Activties"){
//                                    showingSheetA.toggle()
//                                }
//                                .sheet(isPresented: $showingSheetA) {
//                                    AView()
//                                }
//                                .padding()
//                                .foregroundColor(.white)
//                                .background(.green)
//                                .cornerRadius(10)
//                                Button("Museum"){
//                                    showingSheetM.toggle()
//                                }
//                                .sheet(isPresented: $showingSheetM) {
//                                    MView()
//                                }
//                                .padding()
//                                .foregroundColor(.white)
//                                .background(.green)
//                                .cornerRadius(10)
//                                Button("Popular"){
//                                    
//                                }                                .padding()
//                                    .foregroundColor(.white)
//                                    .background(.green)
//                                    .cornerRadius(10)
//                            }
//                        }
                
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
                AHHView(locationName: .constant("Fake location"))
            }
        }
        
        
    }
    
}

#Preview {
    LocationsView()
}
