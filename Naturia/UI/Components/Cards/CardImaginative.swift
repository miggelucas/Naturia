//
//  CardImaginative.swift
//  Naturia
//
//  Created by lrsv on 04/04/23.
//

import Foundation
import SwiftUI

struct CardImaginative: View {
    let journeyProvocation: String
    let journeyImage: Image
    let cardIndex: Int
    
    var body: some View {
        HStack() {
            VStack(alignment: .leading) {
                HStack {
                    Image("iconCloud")
                        .resizable()
                        .scaledToFit()
                        .frame(width: Responsive.scaleWidth(s: 33), height: Responsive.scaleHeight(s: 25))
                    Text("Jornada Criativa")
                        .font(Font.NaturiaSecundary(.Subtitle))
                }
                    
                Spacer().frame(height: Responsive.scaleHeight(s: 24))
                Text(journeyProvocation)
                    .font(Font.NaturiaPrimary(.h2))
                    ._lineHeightMultiple(0.6)
                    .lineLimit(3)
                Spacer()
            }
            .padding(EdgeInsets(top: Responsive.scaleHeight(s: 48), leading: Responsive.scaleWidth(s: 80), bottom: 0, trailing: Responsive.scaleHeight(s: 24)))
            .frame(maxHeight: .infinity, alignment: .leading)
                        Spacer()
                        journeyImage
                
                            .resizable()
                            .scaledToFit()
                            .rotationEffect(.degrees(getRotationDegrees()))
                            .padding(.trailing, cardIndex == 0 ? Responsive.scaleWidth(s: -36) : 0)
        }
        .frame(width: Responsive.scaleWidth(s: 874), height: Responsive.scaleHeight(s: 384))
        .background(Image("Card Carousel").resizable())
    }
    
    func getRotationDegrees() -> Double {
        if (cardIndex == 0) {
            return -12
        } else if (cardIndex == 1) {
            return 32
        } else {
            return 0
        }
    }
}

struct CardImaginative_Preview: PreviewProvider {
    static var previews: some View {
        CardImaginative(
            journeyProvocation: "Como deve ser a planta que indica a chuva no sertão?",
            journeyImage: Image("Trombeta Completa"), cardIndex: 1)
    }
}
