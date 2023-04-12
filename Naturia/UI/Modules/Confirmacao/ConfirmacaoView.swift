//
//  ConfirmacaoView.swift
//  Naturia
//
//  Created by ditthales on 05/04/23.
//  
//

import SwiftUI

struct ConfirmacaoView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @ObservedObject private var viewModel = ConfirmacaoViewModel()
       
    var body: some View {
        ZStack {
            
            BackgroundView()
            
            VStack(spacing: 60) {
                ZStack {
                    Image(viewModel.imagePath)
                        .resizable()
                        .frame(height: 384)
                    Image("cardImageConfirmacao")
                        .resizable()
                    .frame(height: 384)
                }
                TextAndConfirmationButtons(cardType: .grande,
                                           firstLine: "Essa planta será o seu desafio de desenho.",
                                           secondLine: "Você já está presencialmente com ela?",
                                           firstButtonType: .estou,
                                           secondButtonType: .naoEstou,
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
        .ignoresSafeArea()
        .onAppear {
            viewModel.navigationManager = navigationManager
            viewModel.viewDidApper()
        }
    }

}

struct Confirmacao_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmacaoView().previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(NavigationManager())
    }
}
