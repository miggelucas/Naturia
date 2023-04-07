//
//  CTAButton.swift
//  Naturia
//
//  Created by acrn on 04/04/23.
//

import SwiftUI

struct CTAButton: View {
    
    
    
    let buttonType: ButtonType
    
    let actionForButton: () -> Void
    
    
    var body: some View {
        
        Button {
            actionForButton()
            
        } label: {
            
            ZStack {
                
                
                switch buttonType {
                case .estou:
                    Image("CardGreenCTAButton")
                    Text("Estou")
                    
                case .naoEstou:
                    Image("CardWhiteCTAButton")
                    Text("Não estou")
                    
                case .concluido:
                    Image("CardGreenCTAButton")
                    HStack(spacing: 8) {
                        Image("IconCheck")
                        Text("Concluído")
                    }
                case .desenhar:
                    Image("CardGreenCTAButton")
                    Text("Desenhar")
                    
                case .sim:
                    Image("CardGreenCTAButton")
                    Text("Sim!")
                    
                case .agoranao:
                    Image("CardWhiteCTAButton")
                    Text("Agora não...")
                }
                
            }
            .foregroundColor(.black)
            .frame(width: 187, height: 49)
        }
        
    }
}

struct CTAButton_Previews: PreviewProvider {
    static var previews: some View {
        CTAButton(buttonType: .estou, actionForButton: {})
    }
}

enum ButtonType {
    case estou, naoEstou, concluido, desenhar, sim, agoranao
}
