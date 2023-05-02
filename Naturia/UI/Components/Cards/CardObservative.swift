//
//  CardObservative.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 03/04/23.
//

import SwiftUI

struct CardObservative: View {
    
    let plantIconDrawn: Image
    let plantName: String
    
    
    var body: some View {
        ZStack {
            Image("Card Observative")
                .resizable()
                .frame(width: 270, height: 134)
                .scaledToFit()
            
            HStack {
                plantIconDrawn
                    .resizable()
                    .scaledToFit()
                    .frame(width: Responsive.scaleWidth(s: 88), height: Responsive.scaleHeight(s: 88))
                 
                
                Spacer()
            
                Text(plantName)
                    .font(Font.NaturiaSecundary(.cta))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                Spacer()
            }
            .padding(.trailing, 16.0)
            .padding(.leading, 16.0)
        }
        .frame(width: 270, height: 134)
    }
}

struct CardObservative_Previews: PreviewProvider {
    static var previews: some View {
        CardObservative(plantIconDrawn: Image("Mandacaru Completo"), plantName: "Espada de São Jorge")
    }
}
