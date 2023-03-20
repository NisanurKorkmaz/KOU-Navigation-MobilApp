//
//  MapView.swift
//  MobilApp
//
//  Created by Nisanur Korkmaz on 12/10/2022.
//

import SwiftUI
import MapKit
import CoreLocation

struct Place: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

struct MapView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude:  40.82118, longitude: 29.9214), span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
    var veri : String

    var body: some View {
        let str = Int(veri)
        let v = Locations[str!-1]
        let places = [
        Place(name : v.Name, latitude : v.Lat, longitude : v.Lng)]
        Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: places){place in
            MapMarker(coordinate: place.coordinate)
        }

            .ignoresSafeArea()
            .onAppear{
                viewModel.checkIfLocationServicesIsEnabled()

        }

}

struct MapView_Previews: PreviewProvider {
    @State var bilgiler : Place
    
    static var previews: some View {
        MapView(veri : String())
    }
    
}

final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager?
    
    func checkIfLocationServicesIsEnabled(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            checkLocationAutorization()
        }else{
            print("no location")
        }
    }
    
    private func checkLocationAutorization(){
        guard let locationManager = locationManager else {return}
        
        switch locationManager.authorizationStatus{
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("your location is restricted")
        case .denied:
            print("you have denied this app location permission")
        case .authorizedAlways, .authorizedWhenInUse:
            break
        @unknown default :
            break
            
        }
        
    }
}
}
