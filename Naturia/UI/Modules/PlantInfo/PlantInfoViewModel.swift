//
//  PlantInfoViewModel.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 05/04/23.
//

import Foundation

class PlantInfoViewModel: ObservableObject {
    
    @Published var journey: Journey
    @Published var plant: Plant
    
    init(journey: Journey) {
        self.journey = journey
        self.plant = journey.plant
    }
    
    
    func backButtonPressed() {
        // should return to home
    }
    
    
    
}
