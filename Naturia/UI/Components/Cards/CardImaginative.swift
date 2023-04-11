//
//  CardImaginative.swift
//  Naturia
//
//  Created by lrsv on 04/04/23.
//

import Foundation
import SwiftUI

struct CardImaginative: View {
    let journeyTitle: String
    let journeyProvocation: String
    let journeyImage: Image
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(journeyTitle)
                    .font(Font.NaturiaSecundary(.Subtitle))
                Spacer().frame(height: Responsive.scaleHeight(s: 24))
                Text(journeyProvocation)
                    .font(Font.NaturiaPrimary(.h2))
                    ._lineHeightMultiple(0.6)
                    .lineLimit(3)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: Responsive.scaleWidth(s: 96)))
            }
            .padding(EdgeInsets(top: Responsive.scaleHeight(s: 48), leading: Responsive.scaleWidth(s: 80), bottom: 0, trailing: Responsive.scaleHeight(s: 24)))
            Spacer()
            journeyImage
                .resizable()
                .scaledToFit()
                .padding(EdgeInsets(top: Responsive.scaleHeight(s: 16), leading: 0, bottom: Responsive.scaleHeight(s: 16), trailing: Responsive.scaleHeight(s: 24)))
        }
        .frame(width: Responsive.scaleWidth(s: 874), height: Responsive.scaleHeight(s: 384))
        .background(Image("Card Carousel").resizable())
    }
}

struct CardImaginative_Preview: PreviewProvider {
    static var previews: some View {
        CardImaginative(journeyTitle: "Título",
                        journeyProvocation: "Provocação escrita em três linhas",
                        journeyImage: Image("plant"))
    }
}
