//
//  LeftMenuView.swift
//  SeaMap
//
//  Created by İbrahim Güler on 9.08.2021.
//

import SwiftUI

struct LeftMenuView: View {
    @Binding var x : CGFloat
    @Binding var width : CGFloat
    @Binding var selectedIndex : Int
    var body: some View { 
        HStack {
            NavigationView {
                VStack {
                    Spacer()
                    NavigationLink(
                        destination: SettingsMenuView(selectedIndex: self.$selectedIndex),
                        label: {
                            HStack {
                                Image(systemName: "house")
                                Text("Settings")
                            }
                        })
                        .frame(width: UIScreen.main.bounds.width * 0.40, height: UIScreen.main.bounds.height * 0.07, alignment: .center)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
                        .padding(.all, 5)
                    
                    NavigationLink(
                        destination: ContactMenuView(),
                        label: {
                            HStack {
                                Image(systemName: "location")
                                Text("Contact")
                            }
                        })
                        .frame(width: UIScreen.main.bounds.width * 0.40, height: UIScreen.main.bounds.height * 0.07, alignment: .center)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
                        .padding(.all, 5)
                    
                    Spacer()
                    Text("omikron")
                        .padding()
                }.navigationTitle("Settings")
            }
            .border(Color.gray, width: 2)
            .frame(width: UIScreen.main.bounds.width - (UIScreen.main.bounds.width / 2))
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            VStack {
                Spacer()
                HStack {
                    Color.white.opacity(0.00000001)
                        .frame(width: 50, height: UIScreen.main.bounds.height - 193)
                        .gesture(
                            DragGesture()
                                .onChanged({ value in
                                    withAnimation{
                                        if value.translation.width > 0 {
                                            if self.x < 0 {
                                                self.x = -self.width + value.translation.width
                                            }
                                        } else {
                                            self.x = value.translation.width
                                        }
                                    }
                                })
                                .onEnded({ value in
                                    withAnimation{
                                        if -self.x < self.width / 2 {
                                            self.x = 0
                                        } else {
                                            self.x = -self.width
                                        }
                                    }
                                }))
                    
                    Spacer()
                }
            }
            
            
        }
        .transition(.slide)
        .background(Color.black.opacity(self.x == 0 ? 0.5 : 0).ignoresSafeArea(), alignment: .center)

    }
    
    
    
}

struct LeftMenuView_Previews: PreviewProvider {
    
    @State static var x = -UIScreen.main.bounds.width +  (UIScreen.main.bounds.width / 2)
    @State static var width = UIScreen.main.bounds.width -  (UIScreen.main.bounds.width / 2)
    @State static var selectedIndex = 1
    
    static var previews: some View {
        Group {
            LeftMenuView(x: self.$x, width: self.$width, selectedIndex: self.$selectedIndex)
                .previewDevice("iPhone 12 mini").previewDisplayName("iPhone 12 mini")
            
            LeftMenuView(x: self.$x, width: self.$width, selectedIndex: self.$selectedIndex)
                .previewDevice("iPhone 8").previewDisplayName("iPhone 8")
        }
    }
}
