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
    
    var body: some View {
        VStack (alignment: .leading, spacing: 24){
            Button(action: { self.isExpanded.toggle() }) {
                HStack{
                    Text("\(getTitle())")
                        .font(.headline)
                        .foregroundColor(.black)
                    Spacer()
                    if isExpanded{
                        Text("X")
                            .font(.headline)
                            .foregroundColor(.black)
                    }else{
                        Text("v")
                            .font(.headline)
                            .foregroundColor(.black)
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
                    
                    
                }
            }
        }
        .animation(.easeInOut, value: isExpanded)
        .background(.blue)
        .frame(width: getSize().width, height: getSize().height)
        
        
    
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
