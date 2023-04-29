//
//  ConquistaView.swift
//  Naturia
//
//  Created by ditthales on 05/04/23.
//  
//

import SwiftUI

struct ConquistaView: View {
    @ObservedObject private var viewModel = ConquistaViewModel()
    

var body: some View {
    ZStack {
        
        BackgroundView(illustrationType: .conquista)
        
        VStack(spacing: 60){
            HStack{
                Spacer()
                ShareLink(item: viewModel.userDrawImage, preview: SharePreview("Seu desenho", image: viewModel.userDrawImage)){
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
        viewModel.updateUserDrawImage()
    }
}

}

struct Conquista_Previews: PreviewProvider {
    static var previews: some View {
        ConquistaView().previewInterfaceOrientation(.landscapeLeft)
    }
}
