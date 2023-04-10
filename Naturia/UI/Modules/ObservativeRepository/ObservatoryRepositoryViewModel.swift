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
    
    init(journeyArray: [ObservativeJourney] = []) {
        self.journeys = journeyArray
    }
    
    
    let journeys: [ObservativeJourney]
    let textForEmptyState: String = "Sem jornadas no momento =("
    
    func backButtonPressed() {
        if let safeNavManager = navigationManager {
            safeNavManager.path.removeLast()
        }
        print("user pressed to go back to homeScreen")
    }
    
    func journeyPressed(_ journey: ObservativeJourney) {
        print("User pressed in jorney \(journey.name)")
    }
}
