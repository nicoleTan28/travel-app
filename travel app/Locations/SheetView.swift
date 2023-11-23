//
//  SheetView.swift
//  travel app
//
//  Created by Shakthi Vel on 22/11/23.
//

import SwiftUI
import MapKit
@available(iOS 17.0, *)
struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    let zoo = CLLocationCoordinate2D(latitude: 1.4043, longitude: 103.7930)
    let mbs = CLLocationCoordinate2D(latitude: 1.2834, longitude: 103.8607)
    let uss = CLLocationCoordinate2D(latitude: 1.2540, longitude: 103.8238)
    let btnr = CLLocationCoordinate2D(latitude: 1.3554, longitude: 103.7764)

    var body: some View {

        Map(){
            Marker("Singapore Zoo", coordinate: zoo)
            Marker("Marina Bay Sands", coordinate: mbs)
        }


        Button("Press to dismiss") {
            dismiss()
        }
        .font(.title)
        .padding()
        .background(.black)
    }
}
