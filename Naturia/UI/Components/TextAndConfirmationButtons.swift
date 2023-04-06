//
//  TextAndConfirmationButtons.swift
//  Naturia
//
//  Created by ditthales on 30/03/23.
//

import SwiftUI

struct TextAndConfirmationButtons: View {
    
    let cardType: CardType
    let firstLine: String
    var secondLine: String
    let firstButtonType: ButtonType
    var secondButtonType: ButtonType
    let actionForFirstButton: () -> Void
    var actionForSecondButton: () -> Void

    init(cardType: CardType, firstLine: String, secondLine: String = "", firstButtonType: ButtonType, secondButtonType: ButtonType = .sim, actionForFirstButton: @escaping () -> Void, actionForSecondButton: @escaping () -> Void){
        self.cardType = cardType
        self.firstLine = firstLine
        self.secondLine = secondLine
        self.firstButtonType = firstButtonType
        self.secondButtonType = secondButtonType
        self.actionForFirstButton = actionForFirstButton
        self.actionForSecondButton = actionForSecondButton
    }
    
    var body: some View {
        VStack (spacing: -30){
            
            switch cardType{
            case .grande:
                CardCTAMainTrivia(cardType: cardType,
                                  firstLine: firstLine,
                                  secondLine: secondLine)
                HStack (spacing: 24){
                    CTAButton(buttonType: firstButtonType) {
                        actionForFirstButton()
                    }
                    CTAButton(buttonType: secondButtonType) {
                        actionForSecondButton()
                    }
                }
                
            case .pequeno:
                CardCTAMainTrivia(cardType: cardType,
                                  firstLine: firstLine,
                                  secondLine: secondLine)
                CTAButton(buttonType: firstButtonType) {
                    actionForFirstButton()
                }
            }
        }
    }
}


struct TextAndConfirmationButtons_Previews: PreviewProvider {
    static var previews: some View {
        TextAndConfirmationButtons(cardType: .pequeno, firstLine: "Teste de 1 linha", firstButtonType: .sim, actionForFirstButton: {}, actionForSecondButton: {})
    }
}



