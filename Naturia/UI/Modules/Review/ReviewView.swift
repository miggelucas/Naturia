//
//  ReviewView.swift
//  Naturia
//
//  Created by ditthales on 30/03/23.
//  
//

import SwiftUI

struct ReviewView: View {

    @ObservedObject private var viewModel = ReviewViewModel()
       
    var body: some View {
        ZStack {
            
            BackgroundView(illustrationType: .review)
            
            VStack (spacing: 36){
                HStack{
                    Spacer()
                    SaveButton()
                }
                HStack {
                    VStack(spacing: 16) {
                        ZStack {
                            Image("DesenhoCriativo")
                                .resizable()
                                .frame(width: 362, height: 252)
                            Image("cardImage")
                                .resizable()
                                .frame(width: 362, height: 252)
                        }
                        Text("O que você imaginou")
                            .font(Font.NaturiaSecundary(.h5))
                    }
                    Spacer()
                    Image("iconSetaDireita")
                        .padding(.bottom, 40.0)
                    Spacer()
                    VStack(spacing: 16) {
                        ZStack {
                            Image("desenhoUsuario")
                                .resizable()
                                .frame(width: 362, height: 252)
                            Image("cardImage")
                                .resizable()
                                .frame(width: 362, height: 252)
                        }
                        Text("Seu desenho da planta")
                            .font(Font.NaturiaSecundary(.h5))
                    }
                }
                
                TextAndConfirmationButtons(cardType: .grande, firstLine: "Parabéns, olha o quanto você aprendeu!", secondLine: "Quer saber mais sobre o/a [nomedaplanta]?", firstButtonType: .sim, secondButtonType: .agoranao, actionForFirstButton: {}, actionForSecondButton: {})
                    .padding(.top, 19)
            }
            .frame(width: 874)
        }
    }

}

struct Review_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
