//
//  ImageIconView.swift
//  SeaMap
//
//  Created by İbrahim Güler on 9.08.2021.
//

import SwiftUI

struct ImageIconView: View {
    let imageIcon : Image
    var body: some View {
        imageIcon
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 25, height: 25, alignment: .center)
            
            
    }
}

struct ImageIconView_Previews: PreviewProvider {
    static var previews: some View {
        ImageIconView(imageIcon: Image("earth")).previewLayout(.sizeThatFits)
    }
}
