//
//  PlantDescriptionView.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 04/04/23.
//

import SwiftUI

struct CardPlantDescriptionView: View {
    
    let description: String
    
    var body: some View {
        ZStack {
            Image("Card Description")
            
            
            HStack {
                VStack(alignment: .leading) {
                    Text(description)
                        .font(.custom("Montserrat", size: 16))
                    
                    Spacer()
                }
                Spacer()
                
            }
            
            .padding(24)
           
        }
        .frame(width: 549, height: 192 )
    }
}

struct PlantDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        CardPlantDescriptionView(description: "Texto aqui Texto aqui Texto aqui Texto aqui Texto aqui Texto aqui Texto aqui Texto aqui Texto aqui Texto aquiTexto aqui Texto aqui Texto aqui Texto aqui Texto aqui")
    }
}
