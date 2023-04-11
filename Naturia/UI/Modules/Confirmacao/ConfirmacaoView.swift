//
//  ConfirmacaoView.swift
//  Naturia
//
//  Created by ditthales on 05/04/23.
//  
//

import SwiftUI

struct ConfirmacaoView: View {

    @ObservedObject private var viewModel = ConfirmacaoViewModel()
       
    var body: some View {
        ZStack {
            
            BackgroundView()
            
            VStack(spacing: 60) {
                ZStack {
                    Image("jiboiaReferencia")
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
                                           actionForGreenButton: {},
                                           actionForWhiteButton: {})
            }
            .frame(width: 874)
        }
    }

}

struct Confirmacao_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmacaoView().previewInterfaceOrientation(.landscapeLeft)
    }
}
