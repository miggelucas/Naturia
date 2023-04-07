//
//  CardCTAMainTrivia.swift
//  Naturia
//
//  Created by acrn on 04/04/23.
//

import SwiftUI

struct CardCTAMainTrivia: View {
    
    
    
    let cardType: CardType
    let firstLine: String
    var secondLine: String?
    
    
    var body: some View {
        switch cardType{
        case .grande:
            ZStack {
                Image("CardCTAMainTrivia")
                    .resizable()
                Text("\(firstLine)\n\(secondLine ?? "")")
                    .font(Font.NaturiaSecundary(.cta))
                    .multilineTextAlignment(.center)
                    .offset(y: -16)
                    .lineSpacing(8)
                
            } .frame(width: 874, height: 144)
            
        case .pequeno:
            ZStack {
                Image("CardCTAMainTrivia")
                    .resizable()
                Text(firstLine)
                    .font(Font.NaturiaSecundary(.cta))
                    .multilineTextAlignment(.center)
                    .offset(y: -16)
                
            } .frame(width: 874, height: 112)
        }
    }
    
    struct CardCTAMainTrivia_Previews: PreviewProvider {
        static var previews: some View {
            CardCTAMainTrivia(cardType: .grande, firstLine: "Exemplo de texto de 1 linha", secondLine: "Exemplo de texto de 2 linhas")
        }
    }
}

enum CardType {
    case grande, pequeno
}
