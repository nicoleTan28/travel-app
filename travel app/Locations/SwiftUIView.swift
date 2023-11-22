//
//  SwiftUIView.swift
//  travel app
//
//  Created by Shakthi Vel on 22/11/23.
//

import SwiftUI
import MapKit

@available(iOS 17.0, *)
struct SwiftUIView: View {
    // 1
    @State private var locationService = LocationService(completer: .init())
    @State private var search: String = ""
    var body: some View {
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
    }
}

