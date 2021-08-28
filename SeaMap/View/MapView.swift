//
//  MapView.swift
//  SeaMap
//
//  Created by İbrahim Güler on 8.08.2021.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    typealias UIViewType = MKMapView
    
    @ObservedObject private var locationManager = LocationManager()
    
    @Binding var typing : Bool
    @Binding var refresh : Bool
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        self.getMap(mapView: uiView)
    }
    
    func getMap(mapView: MKMapView){
        if self.refresh || !self.refresh  {
            guard let location = locationManager.location  else { return }
            
            if self.typing {
                mapView.mapType = .satellite
            } else {
                mapView.mapType = .standard
            }
            
            let coordinate = location
            let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
            let regin = MKCoordinateRegion(center: coordinate, span: span)
            
            mapView.tintColor = .red
            mapView.showsUserLocation = true
            
            mapView.setRegion(regin, animated: true)
            
        }
    }
}



struct MapView_Previews: PreviewProvider {
    
    @State static var typing  : Bool = false
    @State static var refresh : Bool = true
    
    static var previews: some View {
        Group {
            MapView(typing: self.$typing, refresh: self.$refresh)
                .previewDevice("iPhone 12 mini").previewDisplayName("iPhone 12 mini")
            
            MapView(typing: self.$typing, refresh: self.$refresh)
                .previewDevice("iPhone 8").previewDisplayName("iPhone 8")
        }
    }
}


