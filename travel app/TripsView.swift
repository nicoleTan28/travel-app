//
//  TripsView.swift
//  travel app
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI

struct TripsView: View {
    var body: some View {
        NavigationStack {
            Text("Hello, World!").padding()
                .navigationTitle("Trips")
                .toolbar {
                    ToolbarItem(placement: .automatic) {
                        Button("+") {
                            print("Pressed")
                            
                        }
                        .font(.largeTitle)
                    }
                }
        }
        Text("Trips")
    }
}

struct TripsView_Previews: PreviewProvider {
    static var previews: some View {
        TripsView()
    }
}
