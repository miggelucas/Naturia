//
//  PlantInfoView.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 04/04/23.
//

import SwiftUI

struct PlantInfoView: View {
    var navigationManager = NavigationManager.shared
    
    let viewModel: PlantInfoViewModel
    
    init(viewModel: PlantInfoViewModel) {
        self.viewModel = viewModel

    }
    
    var body: some View {
        
        ZStack {
            BackgroundView()
            
            VStack {
                
                // Back Button
                HStack {
                    BackButton(style: viewModel.buttonStyle, actionForButton: {
                        viewModel.backButtonPressed()
                        print("entrou aqui")
                    })
                    
                    Spacer()
                    
                }
                
                
                
                HStack(spacing: 32) {
                    Image(viewModel.plant.iconPath)
                        .resizable()
                        .scaledToFit()
                        .padding(.vertical, 68)
                    
                    Spacer()
                    
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
                            
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], alignment: .center, spacing: 32) {
                                ForEach(viewModel.plant.trivia, id: \.self) { trivia in
                                    CardPlantTrivia(trivia: trivia)
                                }
                                
                            }
                            .frame(width: 549)
                            
                        }
                        
                    }
                    .foregroundColor(Color("gray-900"))
                    .padding(.top, -50)
                    .padding(.trailing, 5)
                }
            }
            .padding(.horizontal, 32)
            .padding(.top, 48)
            
            
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

struct PlantInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PlantInfoView(viewModel: PlantInfoViewModel(plant: Journey.getObservativePlaceholder().plant, buttonStyle: .back)).previewInterfaceOrientation(.landscapeLeft)
    }
}
