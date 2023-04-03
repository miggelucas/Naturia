//
//  ObservatoryRepositoryView.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 03/04/23.
//

import SwiftUI

struct ObservatoryRepositoryView: View {
    
    let viewModel: ObservatoryRepositoryViewModel
    
    init(viewModel: ObservatoryRepositoryViewModel = ObservatoryRepositoryViewModel()) {
        self.viewModel = viewModel
    }
    
    
    let gridLayout = [GridItem(.flexible()),
                      GridItem(.flexible()),
                      GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            Color("backgroundColor")
            
            VStack {
                HStack {
                    Button {
                        viewModel.backButtonPressed()
                    } label: {
                        Text("Botão de voltar")
                            .font(.custom("Montserrat", fixedSize: 16))
                            .foregroundColor(.black)
                    }

                    
                    Spacer()
                }
                .padding(.bottom, 4)
                
                VStack(spacing: 16) {
                    Text("Jornada Observativa")
                        .font(.custom("Montserrat", fixedSize: 50))
                    
                    Text("Escolha alguma das plantas abaixo e vá ao mundo para desenhá-la")
                        .font(.custom("Montserrat", fixedSize: 20))
                }
                
                .padding(.bottom, 48)

                
                ScrollView {
                    LazyVGrid(columns: gridLayout, alignment: .center, spacing: 32) {
                        ForEach(viewModel.elements, id: \.self) { element in
                            element
                        }
                        
                    }
                    

                }
            }
            .padding(.horizontal, 32)
            .padding(.top, 48)
        }
        .ignoresSafeArea()
    }
}



struct ObservatoryRepositoryView_Previews: PreviewProvider {
    static var previews: some View {
        ObservatoryRepositoryView()
    }
}
