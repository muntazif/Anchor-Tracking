//
//  SettingsMenuView.swift
//  SeaMap
//
//  Created by İbrahim Güler on 10.08.2021.
//

import SwiftUI

struct SettingsMenuView: View {
    
    @Binding var selectedIndex : Int
    @State var textMin = "\(PersistenceController.shared.getAllSetting()[0].delay)"
    
    let items = PersistenceController.shared.getAllSetting()

    var body: some View {
        HStack {
            VStack(spacing: 0) {
                Spacer()
                Group {
                    Text("Unit")
                        .bold()
                    HStack(spacing: 20) {
                        Picker("Unit", selection: self.$selectedIndex) {
                            Text("ft").tag(1)
                            Text("m").tag(2)
                        }.pickerStyle(SegmentedPickerStyle.init().self)
                    }.padding()
                   
                }
                
                Group {
                    Text("Delay")
                        .bold()
                    HStack {
                        
                        TextField("\(items[0].delay)", text: self.$textMin)
                            .frame(width: 40, alignment: .center)
                            .keyboardType(.numberPad)
               
                        Text("min")
                    }
                    .frame(height: 35, alignment: .center)
                    .padding(.horizontal)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
                    .padding()
                
                }
                
                Button(action: {
                    if PersistenceController.shared.getAllSetting().count == 0 {
                        PersistenceController.shared.addSetting(delay: Int32(self.textMin) ?? Int32(5), selected: Int16(self.selectedIndex))
                    } else {
                        items[0].delay = Int32(self.textMin) ?? 5
                        items[0].selected = Int16(self.selectedIndex)
                        PersistenceController.shared.saveSetting()
                    }
                  
                }, label: {
                    Text("Kaydet")
                })
                Spacer()
                Text("omikron")
                    .padding()
                
            } .frame(width: UIScreen.main.bounds.width - (UIScreen.main.bounds.width / 2))
            .background(Color.white)
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            
            Spacer(minLength: 0)
        }
    }
}

struct SettingsMenuView_Previews: PreviewProvider {
    
    @State static var selectedIndex = 1
    
    static var previews: some View {
        Group {
            SettingsMenuView(selectedIndex: self.$selectedIndex)
                .previewDevice("iPhone 12 mini").previewDisplayName("iPhone 12 mini")
            
            SettingsMenuView(selectedIndex: self.$selectedIndex)
                .previewDevice("iPhone 8").previewDisplayName("iPhone 8")
        }
    }
}

