//
//  İnformationView.swift
//  SeaMap
//
//  Created by İbrahim Güler on 14.08.2021.
//

import SwiftUI

struct InfoView: View {
    
    @Binding var typing : Bool
    @Binding var refresh : Bool
    var imageNameMyLocation : String
    var imageNameWind : String
    var imageNameLocation : String
    var imageNameEarth : String
    var imageNameGetLocation : String
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    HStack {
                        Text("23 C")
                
                            .font(.title3)
                            .bold()
                        Spacer()
                        
                        ImageIconView(imageIcon: Image(systemName: imageNameMyLocation))

                    }.padding(.all, 2.5)
                    HStack {
                        ImageIconView(imageIcon: Image(imageNameWind))
                        
                        Text("12 knot")
                            .font(.title3)
                            .bold()
                        Spacer()
                    }.padding(.all, 2.5)
                    HStack {
                        ImageIconView(imageIcon: Image(systemName: imageNameLocation))

                        Text("N")
                            .font(.title3)
                            .bold()
                        Spacer()
                    }.padding(.all, 2.5)
                    HStack {
                        Button(action: {
                            withAnimation {
                                self.typing.toggle()
                            }
                        }, label: {
                            ImageIconView(imageIcon: Image(imageNameEarth))
                        })
                        
                        Spacer()
                    }.padding(.all, 2.5)
                    Spacer()
                    Button(action: {
                        withAnimation {
                            self.refresh.toggle()
                        }
                    }, label: {
                        Image(imageNameGetLocation)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80, alignment: .center)
                            .opacity(0.5)
                    })
                }
            }
            Spacer()
        }.padding(.all, 5)
    }
}


struct InfoView_Previews: PreviewProvider {
    
    @State static var typing = false
    @State static var refresh = true
    static var previews: some View {
        Group {
            InfoView(typing: self.$typing, refresh: self.$refresh, imageNameMyLocation: "location", imageNameWind: "wind", imageNameLocation:  "location.north", imageNameEarth: "earth-white", imageNameGetLocation: "getlocation")
                .previewDevice("iPhone 12 mini").previewDisplayName("iPhone 12 mini")
            
            InfoView(typing: self.$typing, refresh: self.$refresh, imageNameMyLocation: "location", imageNameWind: "wind", imageNameLocation:  "location.north", imageNameEarth: "earth-white", imageNameGetLocation: "getlocation")
                .previewDevice("iPhone 8").previewDisplayName("iPhone 8")
        }
    }
}

