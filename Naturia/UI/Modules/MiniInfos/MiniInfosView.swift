//
//  MiniInfosView.swift
//  Naturia
//
//  Created by acrn on 04/04/23.
//

import SwiftUI

struct MiniInfosView: View {
    @ObservedObject private var viewModel = ReviewViewModel()
    @EnvironmentObject private var navigationManager: NavigationManager
    
    var body: some View {
        ZStack {
            BackgroundView()
                
            
            VStack (spacing: 56) {
                
                HStack(spacing: 32) {
                    CardMainTrivia(mainTriviaContent: "aleatoria")
                    ImageMainTrivia(plantImage: Image("jiboia"))
                }
                
//                Spacer()
                
                TextAndConfirmationButtons(cardType: .pequeno, firstLine: "Agora que você conhece mais essa planta, vamos desenhá-laaa?", firstButtonType: .desenhar, actionForFirstButton: viewModel.onTapFirstButton, actionForSecondButton: viewModel.onTapFirstButton)
                
//                VStack(spacing: -24) {
//                    CardCTAMainTrivia(cardType: .pequeno, firstLine: "Exemplo")
//                    CTAButton(buttonType: .desenhar, actionForButton: {})
//                }
            
        
                Spacer()
            }
            .padding(.top, 48)
            .padding(.leading, 32)
            
        }
        .navigationDestination(for: Journey.self, destination: { journey in
            ReviewView()
        })
        .onAppear {
            viewModel.navigationManager = navigationManager
        }
        
    }
    
    
}

struct MiniInfosView_Previews: PreviewProvider {
    static var previews: some View {
        MiniInfosView().previewInterfaceOrientation(.landscapeLeft)
    }
}
