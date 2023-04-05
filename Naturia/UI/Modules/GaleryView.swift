//
//  GaleryView.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 05/04/23.
//

import SwiftUI

struct GaleryView: View {
    
    
    let viewModel: GaleryViewModel = GaleryViewModel()
    
    
    let gridLayout = [GridItem(.flexible()),
                      GridItem(.flexible()),
                      GridItem(.flexible())]
    
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                
                HStack {
                    BackButton(actionForButton: {})
                    
                    Spacer()
                }
                
                Text("Galeria de Plantas")
                    .font(Font.NaturiaPrimary(.h1))
                
                Text("Subtítulo")
                    .font(Font.NaturiaSecundary(.Subtitle))
                
                ScrollView {
                    LazyVGrid(columns: gridLayout, alignment: .center, spacing: 32) {
                        ForEach(viewModel.completedJourneys, id: \.self) { jorney in
                            Button {
                                viewModel.itemPressed()
                            } label: {
                                CardObservative(plantIconDrawn: jorney.plant.plantIcon,
                                                plantName: jorney.name)
                            }
                        }
                    }
                }
    
            }
        }
        .ignoresSafeArea()
    }
}

struct GaleryView_Previews: PreviewProvider {
    static var previews: some View {
        GaleryView()
    }
}
