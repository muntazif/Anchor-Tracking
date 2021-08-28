//
//  MainView.swift
//  SeaMap
//
//  Created by İbrahim Güler on 9.08.2021.
//

import SwiftUI
import MapKit

struct MainView: View {    
    @State var selectedIndex = Int(PersistenceController.shared.getAllSetting()[0].selected)
    @State var delay = ""
    
    @State var width = UIScreen.main.bounds.width - (UIScreen.main.bounds.width / 2)
    @State var x = -UIScreen.main.bounds.width + (UIScreen.main.bounds.width / 2)
    
    @State var typing = false
    @State var refresh = true
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
           
            MapView(typing: self.$typing, refresh: self.$refresh)
                .disabled(x == 0)
                .ignoresSafeArea()
            
            InfoView(typing: self.$typing, refresh: self.$refresh, imageNameMyLocation: "location", imageNameWind: self.typing ? "wind-white" : "wind", imageNameLocation:  "location.north", imageNameEarth: self.typing ? "earth-white" : "earth", imageNameGetLocation: self.typing ? "getlocation-white" : "getlocation")
                .foregroundColor(self.typing ? .white : .black)
                .disabled(x == 0)
               
            
            LeftMenuView(x: self.$x, width: self.$width, selectedIndex: self.$selectedIndex)
                .offset(x: self.x)
                .ignoresSafeArea()
        
        }
        
    }
    
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .previewDevice("iPhone 12 mini").previewDisplayName("iPhone 12 mini")
            
            MainView()
                .previewDevice("iPhone 8").previewDisplayName("iPhone 8")
        }
    }
}

