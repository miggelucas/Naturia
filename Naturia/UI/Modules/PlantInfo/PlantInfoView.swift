//
//  PlantInfoView.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 04/04/23.
//

import SwiftUI

struct PlantInfoView: View {
    
    let journey: Journey
    var plant: Plant
    
    init(journey: Journey) {
        self.journey = journey
        self.plant = journey.plant
    }
    
    var body: some View {
        
        ZStack {
            
            Color("backgroundColor")
            
            
            VStack {
                
                // Back Button
                HStack {
                    BackButton(style: .backToHome, actionForButton: {})
                    
                    Spacer()
                    
                }
                
                HStack(spacing: 32) {
                    plant.plantIcon
                        .resizable()
                        .scaledToFit()
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 32) {
                            
                            VStack(alignment: .leading, spacing: 16) {
                                HStack(alignment: .lastTextBaseline) {
                                    Text(plant.popularName)
                                        .font(Font.NaturiaPrimary(.h1))
                                    Spacer()
                                    Image("Logo")
                                        .resizable()
                                        .frame(width: 46, height: 46)
                                 
                                }
                                .padding(.vertical, -5)
     
                                
                                
                                
                                Text(plant.scientificName)
                                    .font(Font.NaturiaSecundary(.Subtitle))
                                
                            }
                            
                            VStack(alignment: .leading, spacing: 16) {
                                Text("Descrição")
                                    .font(Font.NaturiaSecundary(.h5))
                                
                                CardPlantDescriptionView(description: plant.description)
                            }
                            
                            
                            VStack(alignment: .leading, spacing: 16) {
                                Text("Local de Origem")
                                    .font(Font.NaturiaSecundary(.h5))
                                
                                CardPlantOrigin(plantOrigin: plant.origin)
                            }
                            
                            
                            VStack(alignment: .leading, spacing: 16) {
                                Text("Trivia")
                                    .font(Font.NaturiaSecundary(.h5))
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
        PlantInfoView(journey: ObservativeJourney.genericPlaceholderObservativeJourney(isDone: false))
    }
}
