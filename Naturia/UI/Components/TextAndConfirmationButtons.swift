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
    let actionForGreenButton: () -> Void
    var actionForWhiteButton: () -> Void

    init(cardType: CardType, firstLine: String, secondLine: String = "", firstButtonType: ButtonType, secondButtonType: ButtonType = .sim, actionForGreenButton: @escaping () -> Void, actionForWhiteButton: @escaping () -> Void){
        self.cardType = cardType
        self.firstLine = firstLine
        self.secondLine = secondLine
        self.firstButtonType = firstButtonType
        self.secondButtonType = secondButtonType
        self.actionForGreenButton = actionForGreenButton
        self.actionForWhiteButton = actionForWhiteButton
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
                        actionForGreenButton()
                    }
                    CTAButton(buttonType: secondButtonType) {
                        actionForWhiteButton()
                    }
                }
                
            case .pequeno:
                CardCTAMainTrivia(cardType: cardType,
                                  firstLine: firstLine,
                                  secondLine: secondLine)
                CTAButton(buttonType: firstButtonType) {
                    actionForGreenButton()
                }
            }
        }
    }
}


struct TextAndConfirmationButtons_Previews: PreviewProvider {
    static var previews: some View {
        TextAndConfirmationButtons(cardType: .grande, firstLine: "Teste de 1 linha", firstButtonType: .sim, actionForGreenButton: {}, actionForWhiteButton: {})
    }
}



