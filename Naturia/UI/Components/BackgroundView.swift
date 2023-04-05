//
//  BackgroundView.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 05/04/23.
//

import SwiftUI

struct BackgroundView: View {
    
    enum IllustrationType{
        case conquista, review
    }
    
    var illustrationType: IllustrationType?
    
    var body: some View {
        ZStack {
            
            LinearGradient(colors: [ Color("background-dark"),
                                     Color("background-light")],
                           startPoint: .bottomLeading,
                           endPoint: .topTrailing)
            Image("texturaBackground")
                .resizable()
                .opacity(0.8)
            if let illustrationType = illustrationType{
                switch illustrationType{
                case .conquista:
                    Image("IlustracoesConquista")
                    
                case .review:
                    Image("IlustracoesReview")
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView().previewInterfaceOrientation(.landscapeLeft)
    }
}
