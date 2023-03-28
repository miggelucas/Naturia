//
//  ExpandableImageView.swift
//  Naturia
//
//  Created by ditthales on 28/03/23.
//

import Foundation

import SwiftUI


struct ExpandableImageView: View {
    @State private var isExpanded = false
    
    var body: some View {
        VStack {
            Button(action: { self.isExpanded.toggle() }) {
                Text("Referência")
                    .font(.headline)
                    .foregroundColor(.black)
            }
            
            if isExpanded {
                Image("nomeDaSuaImagem")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400, height: 400)
            }
        }
        .animation(.easeInOut, value: isExpanded)
    }
}
