//
//  ObservatoryRepositoryViewModel.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 03/04/23.
//

import Foundation
import SwiftUI

class ObservatoryRepositoryViewModel: ObservableObject {
    
    var safeNavManager: NavigationManager = NavigationManager.shared
    
    enum state {
        case empty, content
    }
    
    var state: state {
        if journeys.isEmpty {
            return .empty
        } else {
            return .content
        }
    }
    
    init(journeyArray: [ObservativeJourney] = RepositoryManager.shared.observativeJourneysArray) {
        self.journeys = journeyArray
    }
    
    let journeys: [ObservativeJourney]
    
    let textForEmptyState: String = "Sem jornadas no momento =("
    
    func backButtonPressed() {
            safeNavManager.backToPreviousView()

    }
    
    func journeyPressed(_ journey: ObservativeJourney) {
            RepositoryManager.shared.currentJourney = journey
            safeNavManager.pushToPath(ObservativeRoutes.confirmation)
    }
}
