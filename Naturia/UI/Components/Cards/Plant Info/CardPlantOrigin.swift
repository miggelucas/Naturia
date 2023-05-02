//
//  CardPlantOrigin.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 04/04/23.
//

import SwiftUI

struct CardPlantOrigin: View {
    
    let plantOrigin: String
    
    var body: some View {
        ZStack {
            Image("Card Origin")
            
            HStack {
                VStack(alignment: .leading) {
                    Text(plantOrigin)
                        .font(Font.NaturiaSecundary(.body))
                        .foregroundColor(Color("gray-900"))
                    
                    Spacer()
                }
                Spacer()
                
            }
            .padding(24)
            
        }
        .frame(width: 549, height: 72)
    }
}

struct CardPlantOrigin_Previews: PreviewProvider {
    static var previews: some View {
        CardPlantOrigin(plantOrigin: "Hogwarts - Brazil")
    }
}
