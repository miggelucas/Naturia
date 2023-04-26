//
//  RepositoryManager.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 25/04/23.
//

import Foundation

class RepositoryManager {
    
    static let shared = RepositoryManager()
    
    var currentJourney: Journey
    
    init(currentJourney: Journey = ImaginativeJourney.getPlaceholder()) {
        self.currentJourney = currentJourney
    }
    
    
    
    func update(for journey: Journey) {
        // provavelmente vai funcionar assim
        var journeyArray: [Journey] = getJourneys()

        if let journeyIndex = journeyArray.firstIndex(where: { $0.id == journey.id}) {
            journeyArray[journeyIndex] = journey
        }
        
        
    }
    
    func getJourneys() -> [Journey] {
        return Journey.getObservativeJourneys()
    }
    
    func getImaginativeJourney() -> [ImaginativeJourney] {
        return ImaginativeJourney.getImaginativeJourneys()
    }
    
}
