//
//  MiniInfosView.swift
//  Naturia
//
//  Created by acrn on 04/04/23.
//

import SwiftUI

struct MiniInfosView: View {
    var body: some View {
        ZStack {
            Color("backgroundColor")
            
            VStack {
                
                HStack{
                    BackButton {
                        // Ação para botão
                        print("usuario clicou em backbutton")
                    }
                    
                    Spacer()
                }
                
//                HStack {
//
//                }
                
                Spacer()
                
            }
            
            .padding(.top, 48)
            .padding(.leading, 32)
            
        }
        .ignoresSafeArea()
    }
}

struct MiniInfosView_Previews: PreviewProvider {
    static var previews: some View {
        MiniInfosView()
    }
}
