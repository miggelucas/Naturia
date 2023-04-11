//
//  CardGaleryDrawn.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 05/04/23.
//

import SwiftUI

struct CardGaleryDrawn: View, Hashable {
    let id: UUID = UUID()
    let drawn: Drawn
    let text: String
    
    var body: some View {
        ZStack {
            drawn.image
                .resizable()
            
            Image("CardGaleryDraw")
            
            VStack {
                HStack {
                    switch drawn.type {
                    case .imaginative:
                        Image("iconCloud")
                        
                    case .observative:
                        Image("iconJO")
                    }
                    
                    Spacer()
                }
                
                Spacer()
                
                Text(text)
                    .font(Font.NaturiaSecundary(.Subtitle))
                    .foregroundColor(Color("gray-900"))
                    .padding(.bottom, 8)
            }
            .padding(8)
        }
        .frame(width: 270, height: 188)
    }
}

struct CardGaleryDrawn_Previews: PreviewProvider {
    static var previews: some View {
        CardGaleryDrawn(drawn: .DrawnPlaceholder(type: .imaginative), text: "Desenho")
    }
}
