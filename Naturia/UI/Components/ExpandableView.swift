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
    @State var provocacoes: [String]?
    @State var referencia: String?
    @State var frameDaView: CGSize?
    
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
            VStack (alignment: .leading, spacing: 24){
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
                        Image(referencia ?? "")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                    case .provocacao:
                        VStack(alignment:.leading ,spacing: 8) {
                            if let provocacoes = provocacoes{
                                ForEach(provocacoes, id: \.self){ provocacao in
                                    Text(provocacao)
                                }
                            }else{
                                Text("Poxa nenhuma provocação por aqui! Erro: EVPROV1")
                            }
                        }
                        .font(Font.NaturiaSecundary(.body))
                        
                        
                    }
                    Spacer()
                }
                
            }
            .padding(20)
            .animation(.easeInOut, value: isExpanded)
            .frame(width: frameDaView?.width, height: frameDaView?.height)
        }
        
        
    
    }
    
    
    
    
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
    
}

struct ExpandableView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableView(viewType: .provocacao)
    }
}
