//
//  PlantInfoViewModel.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 05/04/23.
//

import Foundation
import SwiftUI

class PlantInfoViewModel: ObservableObject {
    
    @Published var plant: Plant
    var safeNavManager: NavigationManager = NavigationManager.shared
    let buttonStyle: BackButton.Style
    
    init(plant: Plant, buttonStyle: BackButton.Style) {
        self.plant = plant
        self.buttonStyle = buttonStyle
    }
    
    
    func backButtonPressed() {
            switch buttonStyle {
            case .back:
                safeNavManager.backToPreviousView()
            case .backToHome:
                safeNavManager.popToRoot()
            }
        

        // should return to home
    }
    
    
    
}
