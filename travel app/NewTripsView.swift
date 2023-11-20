//
//  NewTripsView.swift
//  travel app
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI

struct NewTripsView: View {
    var body: some View {
        NavigationView {
            Text("Content")
                .navigationTitle("Navigation Title")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button("Add") {
                            print("pressed")
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading){
                        Button("Cancel") {
                            print("Pressed")
                        }
                    }
                }
            
            
            
            
            
        }
    }
}

struct NewTripsView_Previews: PreviewProvider {
    static var previews: some View {
        NewTripsView()
    }
}
