//
//  BackgroundView.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 05/04/23.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            
            LinearGradient(colors: [ Color("background-dark"),
                                     Color("background-light")],
                           startPoint: .bottomLeading,
                           endPoint: .topTrailing)
            Image("texturaBackground")
                .resizable()
                .opacity(0.8)
        }
        .ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
