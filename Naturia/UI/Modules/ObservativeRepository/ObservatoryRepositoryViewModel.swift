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
    
    init(journeyArray: [Journey] = RepositoryManager.shared.observativeJourneysArray) {
        self.journeys = journeyArray
    }
    
    let journeys: [Journey]
    
    let textForEmptyState: String = "Sem jornadas no momento =("
    
    func backButtonPressed() {
            safeNavManager.backToPreviousView()

    }
    
    func journeyPressed(_ journey: Journey) {
            RepositoryManager.shared.currentJourney = journey
            safeNavManager.pushToPath(ObservativeRoutes.confirmation)
    }
}
