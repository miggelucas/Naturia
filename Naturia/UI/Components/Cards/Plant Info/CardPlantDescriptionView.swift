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
        
        HStack {
            VStack(alignment: .leading) {
                Text(description)
                    .font(Font.NaturiaSecundary(.body))
                    .foregroundColor(Color("gray-900"))

                
                Spacer()
            }
            Spacer()
            
        }
        .padding(24)
        .background {
            Image("Card Description")
                .resizable()
        }
        
        
        
        
    }
}

struct PlantDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack {
            CardPlantDescriptionView(description: "Texto aqui Texto aqui Texto aqui Texto aqui Texto aqui Texto aqui Texto aqui Texto aqui Texto aqui Texto aquiTexto aqui ")
                .padding()
        }
        .padding()
    }
    
}
