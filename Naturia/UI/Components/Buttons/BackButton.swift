//
//  BackButton.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 03/04/23.
//

import SwiftUI

struct BackButton: View {
    enum Style {
        case back, backToHome
    }
    
    init(style: Style = .back, actionForButton: @escaping () -> Void) {
        self.style = style
        self.actionButton = actionForButton
    }
    
    let actionButton: () -> Void
    let style: Style
    
    var body: some View {
        Button {
            actionButton()
            
        } label: {
            HStack(spacing: 8) {
                Image("iconSetaEsquerda")
                
                switch style {
                case .back:
                    Text("Voltar")
                case .backToHome:
                    Text("Voltar ao início")
                }
      
            }
            .foregroundColor(.black)
            .font(.NaturiaSecundary(.button3))
        }

        
        
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton(actionForButton: {})
    }
}
