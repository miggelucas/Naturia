//
//  CardGalleryHome.swift
//  Naturia
//
//  Created by lrsv on 07/04/23.
//

import SwiftUI

struct CardGalleryHome: View {
    let title: String
    let onTap: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                HStack {
                    Image("IconSearch")
                        .frame(width: Responsive.scaleWidth(s: 25), height: Responsive.scaleHeight(s: 32))
                    Text(title)
                        .font(.custom("Montserrat", size: 31))
                }
            }
        }
        .frame(width: Responsive.scaleWidth(s: 270), height: Responsive.scaleHeight(s: 136))
        .background(Image("CardGalleryHome").resizable().scaledToFit())
        .onTapGesture {
            onTap()
        }
    }
}

struct CardGalleryHome_Previews: PreviewProvider {
    static var previews: some View {
        CardGalleryHome(title: "Titulo", onTap: {})
    }
}
