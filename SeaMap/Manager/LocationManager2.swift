//
//  LocationManager2.swift
//  SeaMap
//
//  Created by İbrahim Güler on 22.08.2021.
//

import Foundation
import CoreLocation

class LocationManager2: NSObject, ObservableObject {
    
    private let locationManager = CLLocationManager()
    @Published var location : CLLocation?
    
    override init() {
        super.init()
        
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.startUpdatingLocation()
        
       
        // self.locationManager.headingFilter = 0.00018018 20 metre uyarı
        locationManager.delegate = self
        
    }
}

extension LocationManager2: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        DispatchQueue.main.async {
            self.location = location
        }
    }
}
