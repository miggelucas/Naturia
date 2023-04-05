//
//  PlantInfoView.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 04/04/23.
//

import SwiftUI

struct PlantInfoView: View {
    
    let viewModel: PlantInfoViewModel
    
    init(viewModel: PlantInfoViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        ZStack {
            Color("backgroundColor")
            
            VStack {
                
                // Back Button
                HStack {
                    BackButton(style: .backToHome, actionForButton: {
                        viewModel.backButtonPressed()
                    })
                    
                    Spacer()
                    
                }
                
                HStack(spacing: 32) {
                    viewModel.plant.plantIcon
                        .resizable()
                        .scaledToFit()
                        .padding(.vertical, 68)
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 32) {
                            
                            VStack(alignment: .leading, spacing: 16) {
                                HStack(alignment: .lastTextBaseline) {
                                    Text(viewModel.plant.popularName)
                                        .font(Font.NaturiaPrimary(.h1))
                                    
                                    
                                    Spacer()
                                     
                                    Image("Logo")
                                        .resizable()
                                        .frame(width: 46, height: 46)
                                 
                                }
                                .padding(.vertical, -5)
     
                                
                                Text(viewModel.plant.scientificName)
                                    .font(Font.NaturiaSecundary(.Subtitle))
                                
                            }
                            
                            VStack(alignment: .leading, spacing: 16) {
                                Text("Descrição")
                                    .font(Font.NaturiaSecundary(.h5))
                                
                                CardPlantDescriptionView(description: viewModel.plant.description)
                            }
                            
                            
                            VStack(alignment: .leading, spacing: 16) {
                                Text("Local de Origem")
                                    .font(Font.NaturiaSecundary(.h5))
                                
                                CardPlantOrigin(plantOrigin: viewModel.plant.origin)
                            }
                            
                            
                            VStack(alignment: .leading, spacing: 16) {
                                Text("Trivia")
                                    .font(Font.NaturiaSecundary(.h5))
                            }
                            
                            ScrollView {
                                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], alignment: .center, spacing: 32) {
                                    ForEach(viewModel.plant.trivia, id: \.self) { trivia in
                                        CardPlantTrivia(trivia: trivia)
                                    }
                                }
                            }
                            
                        }
                        
                    }
                    .foregroundColor(Color("gray-900"))
                    .padding(.top, -50)
                }
            }
            .padding(.horizontal, 32)
            .padding(.top, 48)
            
            
        }
        .ignoresSafeArea()
    }
}

struct PlantInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PlantInfoView(viewModel: PlantInfoViewModel(journey: ObservativeJourney.placeholderObservativeJourney(name: "asdasd")))
    }
}
