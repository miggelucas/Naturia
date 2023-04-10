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
    
    init(journeyArray: [ObservativeJourney] = [
        ObservativeJourney.placeholderObservativeJourney(name: "Samambaia"),
        ObservativeJourney.placeholderObservativeJourney(name: "Jiboia"),
        ObservativeJourney.placeholderObservativeJourney(name: "Pau Brasil"),
        ObservativeJourney.placeholderObservativeJourney(name: "Coqueiro"),
        ObservativeJourney.placeholderObservativeJourney(name: "Mangueira"),
        ObservativeJourney.placeholderObservativeJourney(name: "Cacto"),
        ObservativeJourney.placeholderObservativeJourney(name: "Pé de Jaca"),
        ObservativeJourney.placeholderObservativeJourney(name: "Espada de São Jorge"),
        ObservativeJourney.placeholderObservativeJourney(name: "Baobá"),
        ObservativeJourney.placeholderObservativeJourney(name: "Vitória Régia"),
        ObservativeJourney.placeholderObservativeJourney(name: "Jambeiro")
    ]) {
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
        if let safeNavManager = navigationManager {
            safeNavManager.currentJourney = journey
            safeNavManager.path.append(journey)
        }
        print("User pressed in jorney \(journey.name)")
    }
}
