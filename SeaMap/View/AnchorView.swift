//
//  AnchorView.swift
//  SeaMap
//
//  Created by İbrahim Güler on 20.08.2021.
//

import SwiftUI

struct AnchorView: View {
    
    
    var body: some View {
        ZStack {
            AnchorBackgroundView()
                .ignoresSafeArea()
                .opacity(0.5)
            
            Color.blue
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .frame(width: 200, height: 200)
                .opacity(0.5)
                
            VStack {
                Spacer()
                
                Image("anchor")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .frame(width: 50, height: 50)
                    .opacity(1)
                    .padding()
                    .overlay(Color.blue.clipShape(Circle()).opacity(0.5))
                    .padding(.all, 12)
            }
        }
        
    }
}

struct AnchorView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AnchorView()
                .previewDevice("iPhone 12 mini").previewDisplayName("iPhone 12 mini")
            
            AnchorView()
                .previewDevice("iPhone 8").previewDisplayName("iPhone 8")
        }
    }
}
