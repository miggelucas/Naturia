//
//  CardObservative.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 03/04/23.
//

import SwiftUI

struct CardObservative: View, Hashable {
    
    let plantIconDrawn: Image
    let plantName: String
    
    
    // Implementação do protocolo Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(plantName)
    }
    
    static func == (lhs: CardObservative, rhs: CardObservative) -> Bool {
        lhs.plantName == rhs.plantName
    }
    
    var body: some View {
        ZStack {
            Image("Card Observative")
            
            HStack {
                plantIconDrawn
                
                Spacer()
                
                Text(plantName)
                    .font(.system(size: 25))
                    .multilineTextAlignment(.center)
            }
            .padding(.trailing, 23.0)
            .padding(.leading, 16.0)
        }
        .frame(width: 270, height: 134)
    }
}

struct CardObservative_Previews: PreviewProvider {
    static var previews: some View {
        CardObservative(plantIconDrawn: Image("Green Plant"), plantName: "Espada de São Jorge")
    }
}
