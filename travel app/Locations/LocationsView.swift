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
    @State private var showingSheet = false
    @State private var position = MapCameraPosition.automatic
      @State private var isSheetPresented: Bool = false
    @State private var isMarkerVisible = false

    
    var body: some View {
        
        NavigationStack {
            Map(position: $position)
                .frame(width: 300, height: 400)
                .sheet(isPresented: $isSheetPresented) {
                    SwiftUIView()
                    Button("Recommeded Areas") {
                        showingSheet.toggle()
                    }
                    .sheet(isPresented: $showingSheet) {
                        SheetView()
                    }
                    
                }
                .padding()
            
        }
        .navigationTitle("Locations")
        
    }
}
