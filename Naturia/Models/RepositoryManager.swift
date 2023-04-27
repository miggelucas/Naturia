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
    var observativeJourneysArray: [Journey]
    var imaginativeJourneysArray: [ImaginativeJourney]
    
    init(currentJourney: Journey = ImaginativeJourney.getPlaceholder(),
         observativeArray: [Journey] = Journey.getObservativeJourneys(),
         imaginativeArray: [ImaginativeJourney] = ImaginativeJourney.getImaginativeJourneys()
    ){
        self.currentJourney = currentJourney
        self.observativeJourneysArray = observativeArray
        self.imaginativeJourneysArray = imaginativeArray
    }
    
    func userDidCompletedCurrentJourney() {
        self.currentJourney.isCompleted = true
        
        if currentJourney is ImaginativeJourney {
            updateImaginative()
        } else {
            updateObservative()
        }
    }
    
    private func updateImaginative() {
        if let journeyIndex = imaginativeJourneysArray.firstIndex(where: { $0.id == currentJourney.id}) {
            let journey = currentJourney as! ImaginativeJourney
            imaginativeJourneysArray[journeyIndex] = journey
        }
    }
    
    private func updateObservative() {
        if let journeyIndex = observativeJourneysArray.firstIndex(where: { $0.id == currentJourney.id}) {
            observativeJourneysArray[journeyIndex] = currentJourney
        }

    }

    func getAllJourneys() -> [Journey] {        
        return self.imaginativeJourneysArray + self.observativeJourneysArray
        
    }
    
}
