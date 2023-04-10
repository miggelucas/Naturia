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
    var navigationManager: NavigationManager?
    
    init(journey: Journey) {
        self.journey = journey
        self.plant = journey.plant
    }
    
    
    func backButtonPressed() {
        if let safeNavigationManager = navigationManager{
            safeNavigationManager.popToRoot()
        }
    }
    
    
    
}
