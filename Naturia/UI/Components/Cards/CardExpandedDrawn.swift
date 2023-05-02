//
//  CardExpandedDrawn.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 08/04/23.
//

import SwiftUI

struct CardExpandedDrawn: View {
    
    let name: String
    let drawn: Drawn
    
    
    var body: some View {
        ZStack {
            drawn.image
                .resizable()
            
            Image("CardExpandedDrawn")
            
            VStack {
                HStack {
                    Spacer()
                    
                    switch drawn.type {
                    case .imaginative:
                        Image("iconCloud")
                    case .observative:
                        Image("iconJO")
                    }
                        
                }
                
                Spacer()
                
                Text(name)
                    .font(Font.NaturiaSecundary(.h3))
            }
            .padding(32)
                
        }
        .frame(width: 1130, height: 680)
    }
}

struct CardExpandedDrawn_Previews: PreviewProvider {
    static var previews: some View {
        CardExpandedDrawn(name: "Nome da Planta",
                          drawn: Drawn.DrawnPlaceholder(type:.imaginative))
        .previewInterfaceOrientation(.landscapeLeft)
    }
}
