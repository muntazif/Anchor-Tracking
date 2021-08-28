//
//  DENEME.swift
//  SeaMap
//
//  Created by İbrahim Güler on 9.08.2021.
//

import SwiftUI

struct DENEME: View {
    @StateObject var locationManager = LocationManager()
        
        var userLatitude: String {
            return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
        }
        
        var userLongitude: String {
            return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
        }
    var body: some View {
        VStack {
            Text(userLatitude)
            Text(userLongitude)
        }
    }
}

struct DENEME_Previews: PreviewProvider {
    static var previews: some View {
        DENEME()
    }
}
