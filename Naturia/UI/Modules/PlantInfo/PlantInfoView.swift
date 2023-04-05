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
                        .padding(.vertical, 68)
                        .offset(x: -16)
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 32) {
                            
                            VStack(alignment: .leading, spacing: 16) {
                                Text(plant.popularName)
                                
                                
                                Text(plant.scientificName)
                                
                            }
                            
                            VStack(alignment: .leading, spacing: 16) {
                                Text("Descrição")
                                
                                CardPlantDescriptionView(description: plant.description)
                            }
                            
                            
                            VStack(alignment: .leading, spacing: 16) {
                                Text("Local de Origem")
                                
                                CardPlantOrigin(plantOrigin: plant.origin)
                            }
                            
                            
                            VStack(alignment: .leading, spacing: 16) {
                                Text("Trivia")
                            }
                            
                            
                            
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

struct PlantInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PlantInfoView(journey: ObservativeJourney.genericPlaceholderObservativeJourney(isDone: false))
    }
}
