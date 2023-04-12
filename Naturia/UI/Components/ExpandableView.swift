//
//  ExpandableImageView.swift
//  Naturia
//
//  Created by ditthales on 28/03/23.
//

import Foundation

import SwiftUI

struct ExpandableView: View {
    @State private var isExpanded = true
    @State var viewType: ExpandableViewType
    @Binding var provocacoes: [String]
    @Binding var referencia: String
    @State var frameDaView: CGSize?
    
    
    func getTitle() -> String{
        
        switch viewType{
        case .referencia:
            return "Referência"
        case .provocacao:
            return "Provocações"
        }
    }
    
    func getSize() -> CGSize{
        if isExpanded{
            switch viewType{
            case .referencia:
                return CGSize(width: 400, height: 400)
            case .provocacao:
                return CGSize(width: 375, height: 204)
            }
        }else{
            let targetSize = CGSize(width: 0, height: 0)
            return targetSize
        }
        
    }
    
    
    var body: some View {
        ZStack {
            if isExpanded{
                Image("contornoToggleAberto")
                    .onAppear{
                        self.frameDaView = CGSize(width: 375, height: 204)
                    }
            }else{
                Image("contornoToggleFechado")
                    .onAppear{
                        self.frameDaView = CGSize(width: 200, height: 56)
                    }
            }
            VStack (alignment: .leading, spacing: 8){
                Button(action: { self.isExpanded.toggle() }) {
                    HStack{
                        Text("\(getTitle())")
                            .font(Font.NaturiaSecundary(.h5))
                            .foregroundColor(.black)
                        Spacer()
                        if isExpanded{
                            Image("iconFechar")
                        }else{
                            Image("iconSetaBaixo")
                        }
                    }
                }
                
                if isExpanded {
                    
                    switch viewType{
                        
                    case .referencia:
                        
                        VStack(alignment: .center) {
                            Image(referencia)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        .frame(width: 325, height: 124, alignment: .center)
                        
                    case .provocacao:
                        VStack(alignment:.leading ,spacing: 8) {
                            ForEach(provocacoes, id: \.self){ provocacao in
                                VStack {
                                    Text(provocacao)
                                        .frame(width: 350, alignment: .leading)
                                        .lineLimit(nil)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
//                                .frame(height: .infinity)

                            }
                        }
                        .font(Font.NaturiaSecundary(.body))
//                        .border(.pink)
                        
                        
                    }
                    Spacer()
                }
                
            }
            .padding(20)
            .animation(.easeInOut, value: isExpanded)
            .frame(width: frameDaView?.width, height: frameDaView?.height)
        }
        
        
        
    }
    
    
}

struct ExpandableView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableView(viewType: .referencia,
                       provocacoes: .constant(["Qual característica ela deve ter para habitar o sertão?", "O que tem nessa planta que indica a vinda da chuva?", "Como você imagina que seria o porte dela?"]),
                       referencia: .constant("pitangueira"))
    }
}
