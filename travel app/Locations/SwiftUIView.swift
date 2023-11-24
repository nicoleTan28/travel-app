//
//  SwiftUIView.swift
//  travel app
//
//  Created by Shakthi Vel on 22/11/23.
//


import SwiftUI
import MapKit


struct SwiftUIView: View {
    @StateObject private var viewModel = ContentViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
            .ignoresSafeArea()
            .accentColor(Color(.systemPink))
            .onAppear(){
                viewModel.checklocationenabled()
            }
        Button("Press to dismiss") {
                    dismiss()
                }
                .font(.title2)
                .padding()
                .background(.white)
    }
}

#Preview {
    SwiftUIView()
}


final class ContentViewModel:NSObject, ObservableObject, CLLocationManagerDelegate{
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 1.3521, longitude: 103.8198), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

    
    var locationManager:CLLocationManager?
    
    func checklocationenabled(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            locationManager!.delegate = self
        } else {
            print("Show alert to turn on")
        }
    }
    
    private func checklocatauthorization(){
        guard let locationManager = locationManager else{return}
        
        switch locationManager.authorizationStatus{
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("location restricted L bozo")
        case .denied:
            print("U have denied it bro")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate , span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        @unknown default:
            break
        }
    
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checklocatauthorization()
    }
    
}

#Preview {
    SwiftUIView()
}
