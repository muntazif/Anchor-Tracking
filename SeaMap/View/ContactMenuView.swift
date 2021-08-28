//
//  ContactMenuView.swift
//  SeaMap
//
//  Created by İbrahim Güler on 11.08.2021.
//

import SwiftUI

struct ContactMenuView: View {
    var body: some View {
        HStack {
            VStack(spacing: 0) {
                Spacer()
                Button(action: {}, label: {
                    Text("Help")
                })
                .frame(width: UIScreen.main.bounds.width * 0.35, height: UIScreen.main.bounds.height * 0.05, alignment: .center)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
                .padding()
                
                Button(action: {}, label: {
                    Text("User agreement")
                })
                .frame(width: UIScreen.main.bounds.width * 0.35, height: UIScreen.main.bounds.height * 0.05, alignment: .center)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
                .padding()

                Spacer()
                Text("omikron")
                    .padding()
                
            } .frame(width: UIScreen.main.bounds.width - (UIScreen.main.bounds.width / 2))
            .background(Color.white)
            
            Spacer(minLength: 0)
        }
    }
}

struct ContactMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ContactMenuView()
    }
}
