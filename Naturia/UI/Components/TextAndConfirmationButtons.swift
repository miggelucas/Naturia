//
//  TextAndConfirmationButtons.swift
//  Naturia
//
//  Created by ditthales on 30/03/23.
//

import SwiftUI

struct TextAndConfirmationButtons: View {
    var body: some View {
        VStack (spacing: -30){
            ZStack {
                Rectangle()
                Text("MEUDEUSDOCEU QUE TELA LINDA OBRA DE ARTE COISA FINA DELICIA NOVO CONCEITO DE DESIGN")
                    .foregroundColor(.white)
                    .padding(.bottom, 30)
            }
            .frame(width: .infinity, height: 102)
            .foregroundColor(.green)
            HStack (spacing: 24){
                Button {
                    
                } label: {
                    Rectangle()
                        .frame(width: 187, height: 49)
                        .foregroundColor(.red)
                }
                
                Button {
                    
                } label: {
                    Rectangle()
                        .frame(width: 187, height: 49)
                        .foregroundColor(.blue)
                }

            }
        }
    }
}


