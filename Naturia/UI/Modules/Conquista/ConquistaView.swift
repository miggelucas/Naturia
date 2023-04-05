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
        VStack(spacing: 56){
            HStack{
                Spacer()
                SaveButton()
            }
            Image("Logo")
            TextAndConfirmationButtons(cardType: .grande, firstLine: "Você registrou uma nova planta! Ela estará na sua galeria.", secondLine: "Deseja conhecer mais sobre ela?", firstButtonType: .sim, secondButtonType: .agoranao, actionForFirstButton: {}, actionForSecondButton: {})
        }
        .frame(width: 874)
    }

}

struct Conquista_Previews: PreviewProvider {
    static var previews: some View {
        ConquistaView().previewInterfaceOrientation(.landscapeLeft)
    }
}
