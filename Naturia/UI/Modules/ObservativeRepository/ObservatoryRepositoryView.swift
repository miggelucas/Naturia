//
//  ObservatoryRepositoryView.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 03/04/23.
//

import SwiftUI

struct ObservatoryRepositoryView: View {
    
    let elements = [
        CardObservative(plantIconDrawn: Image("Red Plant"), plantName: "Planta Verde"),
        
        CardObservative(plantIconDrawn: Image("Red Plant"), plantName: "Planta Vermelha44"),
        
        CardObservative(plantIconDrawn: Image("Violet Plant"), plantName: "Planta Vermelha213"),
        
        CardObservative(plantIconDrawn: Image("Green Plant"), plantName: "Planta Vermelha1"),
        
        CardObservative(plantIconDrawn: Image("Red Plant"), plantName: "Planta Vermelha2"),
        
        CardObservative(plantIconDrawn: Image("Red Plant"), plantName: "Planta Vermelha3"),
        CardObservative(plantIconDrawn: Image("Red Plant"), plantName: "Planta Vermelha4"),
        
        CardObservative(plantIconDrawn: Image("Red Plant"), plantName: "Planta Vermelha5"),
        
        CardObservative(plantIconDrawn: Image("Red Plant"), plantName: "Planta Vermelha6"),
        CardObservative(plantIconDrawn: Image("Red Plant"), plantName: "Planta Vermelha7"),
        
        CardObservative(plantIconDrawn: Image("Red Plant"), plantName: "Planta Vermelha8"),
        
        CardObservative(plantIconDrawn: Image("Red Plant"), plantName: "Planta Vermelha9")
    ]
    
    
    let gridLayout = [GridItem(.flexible()),
                      GridItem(.flexible()),
                      GridItem(.flexible())]
    
    var body: some View {
        VStack {
            HStack {
                Text("Botão de voltar")
                
                Spacer()
            }
            .padding(.bottom, 4)
            
            VStack(spacing: 16) {
                Text("Jornada Observativa")
                
                Text("Escolha alguma das plantas abaixo e vá ao mundo para desenhá-la")
            }
            
            .padding(.bottom, 48)

            
            ScrollView {
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 32) {
                    ForEach(elements, id: \.self) { element in
                        element
                    }
                    
                }
                

            }
        }
    }
}



struct ObservatoryRepositoryView_Previews: PreviewProvider {
    static var previews: some View {
        ObservatoryRepositoryView()
    }
}
