//
//  DrawImageView.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 08/04/23.
//

import SwiftUI

struct DrawImageView: View {
    
    let drawn: Drawn
    let name: String
    
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack(spacing: 32) {
                HStack {
                    BackButton {
                        // volta para tela de geleria
                        NavigationManager.shared.backToPreviousView()
                    }
                    Spacer()
                }
                CardExpandedDrawn(name: name,
                                  drawn: drawn)
            }
            .padding(32)
            
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

struct DrawImageView_Previews: PreviewProvider {
    static var previews: some View {
        DrawImageView(drawn: Drawn.DrawnPlaceholder(type: .imaginative),
                      name: "Pé de Jambo")
        .previewInterfaceOrientation(.landscapeLeft)
    }
}
