//
//  ObservatoryRepositoryViewModel.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 03/04/23.
//

import Foundation
import SwiftUI

class ObservatoryRepositoryViewModel: ObservableObject {
    
    var navigationManager: NavigationManager?
    
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
    
    init(journeyArray: [Journey] = Journey.getObservativeJourneys()) {
        self.journeys = journeyArray
    }
    
    let journeys: [Journey]
    
    let textForEmptyState: String = "Sem jornadas no momento =("
    
    func backButtonPressed() {
        if let safeNavManager = navigationManager {
            safeNavManager.backToPreviousView()
        }
    }
    
    func journeyPressed(_ journey: Journey) {
        if let safeNavManager = navigationManager {
            safeNavManager.currentJourney = journey
            safeNavManager.pushToPath(Routes.confirmacao)
        }
    }
}
