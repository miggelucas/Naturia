//
//  RepositoryManager.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 25/04/23.
//

import Foundation
import CoreData


class RepositoryManager {
    

    static let shared = RepositoryManager()
    
    let coreDataManager = CoreDataManager()
    
    // all this should be private
    // refact it later
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
        
        for drawn in currentJourney.userDrawns {
            Task {
                await coreDataManager.saveDrawn(for: drawn)
            }
     
        }
       
    }
    
    func getAllJourneys() -> [Journey] {
        return self.imaginativeJourneysArray + self.observativeJourneysArray
        
    }
    
    func loadJourneysDrawns() -> [Journey] {
        let journeysArray = getAllJourneys()
        
        coreDataManager.fetchDrawns { result in
            switch result {
            case .success(let drawsArray):
                for draw in drawsArray {
                    for journey in journeysArray {
                        if draw.plantName == journey.plant.popularName {
                            journey.isCompleted = true
                            journey.userDrawns.append(draw)
                            print("Journey load Draw for plant: \(journey.plant.popularName)")
                        }
                    }
                }
                
                
            case .failure(let error):
                print("Failed to load drawns: \(error)")
            }
            
            
        }
        
        return journeysArray
        
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

    
}
