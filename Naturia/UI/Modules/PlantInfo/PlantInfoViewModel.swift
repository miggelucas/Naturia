//
//  PlantInfoViewModel.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 05/04/23.
//

import Foundation
import SwiftUI

class PlantInfoViewModel: ObservableObject {
    
    @Published var journey: Journey
    @Published var plant: Plant
    var navigationManager: NavigationManager?
    let buttonStyle: BackButton.Style
    
    init(journey: Journey = RepositoryManager.shared.currentJourney, buttonStyle: BackButton.Style) {
        self.journey = journey
        self.plant = journey.plant
        self.buttonStyle = buttonStyle
    }
    
    
    func backButtonPressed() {
        if let safeNavManager = navigationManager {
            switch buttonStyle {
            case .back:
                safeNavManager.backToPreviousView()
            case .backToHome:
                safeNavManager.popToRoot()
            }
        }

        // should return to home
    }
    
    
    
}
