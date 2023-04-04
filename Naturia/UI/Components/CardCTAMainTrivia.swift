//
//  CardCTAMainTrivia.swift
//  Naturia
//
//  Created by acrn on 04/04/23.
//

import SwiftUI

struct CardCTAMainTrivia: View {
    
    var body: some View {
        ZStack {
            Image("CardCTAMainTrivia")
            Text("Agora que você conhece mais essa planta, vamos desenhá-la?")
                .font(.custom("Montserrat", size: 25))
                .fontWeight(.regular)
                .offset(y: -4)
            
        } .frame(width: 874, height: 112)
    }
    
    struct CardCTAMainTrivia_Previews: PreviewProvider {
        static var previews: some View {
            CardCTAMainTrivia()
        }
    }
}
