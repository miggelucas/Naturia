//
//  ConquistaView.swift
//  Naturia
//
//  Created by ditthales on 05/04/23.
//  
//

import SwiftUI

struct ConquistaView: View {

    @EnvironmentObject var navigationManager: NavigationManager
    @ObservedObject private var viewModel = ConquistaViewModel()
    
    var userDrawImage: Image{
        if let drawns = navigationManager.currentObservativeJourney?.userDrawns {
            for drawn in drawns {
                if drawn.type == .observative{
                    return drawn.image
                }
            }
        }
        return Image("DesenhoCriativo")
        
    }
       
    var body: some View {
        ZStack {
            
            BackgroundView(illustrationType: .conquista)
            
            VStack(spacing: 60){
                HStack{
                    Spacer()
                    ShareLink(item: userDrawImage, preview: SharePreview("Seu desenho", image: userDrawImage)){
                        SaveButton()
                    }
                }
                Image("Logo")
                TextAndConfirmationButtons(cardType: .grande,
                                           firstLine: "Você registrou uma nova planta! Ela estará na sua galeria.",
                                           secondLine: "Deseja conhecer mais sobre ela?",
                                           firstButtonType: .sim,
                                           secondButtonType: .agoranao,
                                           actionForGreenButton: {
                    viewModel.confirmativeButtonPressed()
                    
                },
                                           actionForWhiteButton: {
                    viewModel.dismissButtonPressed()
                })
            }
            .frame(width: 874)
        }
        .navigationBarBackButtonHidden(true)
        .onAppear{
            viewModel.navigationManager = navigationManager
        }
    }

}

struct Conquista_Previews: PreviewProvider {
    static var previews: some View {
        ConquistaView().previewInterfaceOrientation(.landscapeLeft).environmentObject(NavigationManager())
    }
}
