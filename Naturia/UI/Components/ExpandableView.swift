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
    
    var body: some View {
        VStack (alignment: .leading){
            Button(action: { self.isExpanded.toggle() }) {
                Text("\(getTitle()) 🔽")
                    .font(.headline)
                    .foregroundColor(.black)
            }
            
            if isExpanded {
                
                switch viewType{
                    
                case .referencia:
                    Image("plantinha")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400, height: 400)
                    
                case .provocacao:
                    Text("Provocação 1 aaaaaaaaaa")
                    Text("Provocação 2 aaaaaaaaaa")
                    Text("Provocação 3 aaaaaaaaaaa")
                    
                }
            }
        }
        .animation(.easeInOut, value: isExpanded)
    
    }
    func getTitle() -> String{
        switch viewType{
        case .referencia:
            return "Referências"
        case .provocacao:
            return "Provocações"
        }
    }
}
