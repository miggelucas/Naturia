//
//  PlantInfoViewModel.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 05/04/23.
//

import Foundation
import SwiftUI

class PlantInfoViewModel: ObservableObject {
    
    var journey: Journey
    
    var NavManager: NavigationManager = NavigationManager.shared
    let repositoryManager: RepositoryManager = RepositoryManager.shared
    let buttonStyle: BackButton.Style
    
    var plant: Plant {
        journey.plant
    }
    
    init(buttonStyle: BackButton.Style) {
        self.journey = repositoryManager.currentJourney
        self.buttonStyle = buttonStyle
    }
    
    
    func backButtonPressed() {
            switch buttonStyle {
            case .back:
                NavManager.backToPreviousView()
            case .backToHome:
                NavManager.popToRoot()
            }
        

        // should return to home
    }
    
    func userDrawnsPressed() {
        NavManager.pushToPath(GaleryRoutes.drawGalery)
    }
    
    
}
