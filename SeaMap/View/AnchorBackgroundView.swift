//
//  AnchorBackgroundView.swift
//  SeaMap
//
//  Created by İbrahim Güler on 22.08.2021.
//

import SwiftUI

struct AnchorBackgroundView: View {
    var body: some View {
        ZStack {
            Color.gray
                .frame(width: UIScreen.main.bounds.width)
        }
    }
}

struct AnchorBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        AnchorBackgroundView()
    }
}
