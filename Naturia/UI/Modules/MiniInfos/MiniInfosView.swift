//
//  MiniInfosView.swift
//  Naturia
//
//  Created by acrn on 04/04/23.
//

import SwiftUI

struct MiniInfosView: View {
    
    
    
    var body: some View {
        ZStack {
            Color("backgroundColor")
                .ignoresSafeArea()
                
            
            VStack (spacing: 56) {
                
                HStack{
                    BackButton {
                        // Ação para botão
                        print("usuario clicou em backbutton")
                    }
                    
                    Spacer()
                }
                
                HStack(spacing: 32) {
                    CardMainTrivia(mainTriviaContent: "aleatoria")
                    ImageMainTrivia(plantImage: Image("jiboia"))
                }
                
//                Spacer()
                
                VStack(spacing: -24) {
                    CardCTAMainTrivia(cardType: .pequeno, firstLine: "Exemplo")
                    CTAButton(buttonType: .desenhar, actionForButton: {})
                }
            
        
                Spacer()
            }
            .padding(.top, 48)
            .padding(.leading, 32)
            
        }
        .ignoresSafeArea()
        
    }
    
}

struct MiniInfosView_Previews: PreviewProvider {
    static var previews: some View {
        MiniInfosView()
    }
}
