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
        ZStack {
            Image("Card Trivia")
            
            HStack {
                VStack(alignment: .leading) {
                    Text(trivia)
                        .font(.custom("Montserrat", size: 16))
                    
                    Spacer()
                }
                Spacer()
                
            }
            .padding(24)
            
        }
        .frame(width: 258, height: 312)
    }
}

struct CardPlantTrivia_Previews: PreviewProvider {
    static var previews: some View {
        CardPlantTrivia(trivia: "Você já parou pra pensar que reflexão é um reflexo muito grande")
    }
}
