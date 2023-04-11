//
//  MiniInfosView.swift
//  Naturia
//
//  Created by acrn on 04/04/23.
//

import SwiftUI

struct MiniInfosView: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            
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
    
                
                TextAndConfirmationButtons(cardType: .pequeno, firstLine:  "Agora que você conhece mais essa planta, vamos desenhá-la?", firstButtonType: .desenhar, actionForGreenButton: {
                    print("greenButton pressed")
//                    let journey = navigationManager.currentJourney
                    navigationManager.path.append("Vai pra próxima tela por favor")
                }, actionForWhiteButton: {})
                
                //                VStack(spacing: -24) {
                //                    CardCTAMainTrivia(cardType: .pequeno, firstLine: "Exemplo")
                //                    CTAButton(buttonType: .desenhar, actionForButton: {})
                //                }
                
                
                Spacer()
            }
            .padding(.top, 48)
            .padding(.leading, 32)
            
        }
        .navigationDestination(for: String.self, destination: { string in
            CanvasView(viewModel: CanvasViewModel(canvasRole: .imaginative2))

        })
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
        
    }
    
}

struct MiniInfosView_Previews: PreviewProvider {
    static var previews: some View {
        MiniInfosView().previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(NavigationManager())
    }
}
