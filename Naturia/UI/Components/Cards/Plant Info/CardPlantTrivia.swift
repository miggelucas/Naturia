//
//  CardPlantTrivia.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 04/04/23.
//

import SwiftUI

struct CardPlantTrivia: View {
    
    let trivia: String
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text(trivia)
                    .font(Font.NaturiaSecundary(.body))
                    .foregroundColor(Color("gray-900"))
                
                Spacer()
            }
            Spacer()
            
        }
        .padding(24)
        .background {
            Image("Card Trivia")
                .resizable()
            
        }
    }
}

struct CardPlantTrivia_Previews: PreviewProvider {
    static var previews: some View {
        CardPlantTrivia(trivia: "Você já parou pra pensar que reflexão é um reflexo muito grande")
    }
}
