//
//  CardObservativeHome.swift
//  Naturia
//
//  Created by lrsv on 05/04/23.
//

import SwiftUI

struct CardObservativeHome: View {
    let title: String
    let description: String
    let onTap: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Image("IconSearch")
                        .frame(width: Responsive.scaleWidth(s: 25), height: Responsive.scaleHeight(s: 32))
                    Text(title)
                        .font(.custom("Montserrat", size: 31))
                }
                Spacer().frame(height: Responsive.scaleHeight(s: 8))
                Text(description)
                    .font(.custom("Montserrat", size: 16))
                    
            }
            .padding(.horizontal, 40)
            .padding(.vertical, 36)
           Spacer()
        }
        .frame(width: Responsive.scaleWidth(s: 572), height: Responsive.scaleHeight(s: 136))
        .background(Image("Card Carousel").resizable())
        .onTapGesture {
            onTap()
        }
    }
}

struct CardObservativeHome_Previews: PreviewProvider {
    static var previews: some View {
        CardObservativeHome(title: "Titulo", description: "Poxa", onTap: {})
    }
}
