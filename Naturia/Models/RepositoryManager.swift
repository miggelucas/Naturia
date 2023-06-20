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
    var observativeJourneysArray: [ObservativeJourney]
    var imaginativeJourneysArray: [ImaginativeJourney]
    
    
    var plants: [Plant] = []
    var currentPlant: Plant?
    
    init(currentJourney: Journey = ImaginativeJourney.getPlaceholder(),
         observativeArray: [ObservativeJourney] = ObservativeJourney.getObservativeJourneys(),
         imaginativeArray: [ImaginativeJourney] = ImaginativeJourney.getImaginativeJourneys()
    ){
        self.currentJourney = currentJourney
        self.observativeJourneysArray = observativeArray
        self.imaginativeJourneysArray = imaginativeArray
        
        self.plants = loadPlants()
    }
    
    private func refreshJourneys() {
        self.observativeJourneysArray = ObservativeJourney.getObservativeJourneys()
        self.imaginativeJourneysArray = ImaginativeJourney.getImaginativeJourneys()
    }
    
    func loadPlants() -> [Plant] {
        var plantsArray: [Plant] = []
        
        coreDataManager.fetchPlants { result in
            switch result {
            case .success(let plants):
                print("load plants success")
                plantsArray = plants
                
            case .failure(let error):
                print("failed to load plants: \(error)")
            }
        }
        
        return plantsArray
        
    }
    
    func update(for plant: Plant) {
        currentJourney.plant = plant
        
        // if is a new plant
        Task {
            if !plants.contains(where: { $0.id == plant.id }) {
                await coreDataManager.savePlant(for: plant) { [self] result in
                    switch result {
                    case .success(let mensage):
                        print(mensage)
                        self.plants = self.loadPlants()
                        
                    case .failure(let error):
                        print("failed to save new Plant error: \(error.localizedDescription)")
                    }
                }
            }
        }

        
    }
    
    func userDidCompletedCurrentJourney() {
        
        if currentJourney is ImaginativeJourney {
            updateImaginative()
        } else {
            updateObservative()
        }
        
        //        Task {
        //            for drawn in currentJourney.userDrawns {
        //                await coreDataManager.saveDrawn(for: drawn) { result in
        //                    switch result {
        //                    case .success(let message):
        //                        // could also inform user of result
        //                        print(message)
        //                    case .failure(let error):
        //                        print(error.localizedDescription)
        //                    }
        //                }
        //            }
        
        refreshJourneys()
    }
    
    
    private func getAllJourneys() -> [Journey] {
        //        return self.imaginativeJourneysArray + self.observativeJourneysArray
        return ObservativeJourney.getObservativeJourneys()
        
    }
    
    func loadJourneysDrawns() -> [Journey] {
        let journeysArray = getAllJourneys()
        
        //        coreDataManager.fetchDrawns { result in
        //            switch result {
        //            case .success(let drawsArray):
        //                for draw in drawsArray {
        //                    for journey in journeysArray {
        //                        if draw.journeyId == journey.id {
        //                            journey.isCompleted = true
        //                            journey.userDrawns.append(draw)
        //                            print("JourneyId \(journey.id) load Draw \(draw.id) for plant: \(journey.plant.popularName)")
        //                        }
        //                    }
        //                }
        //
        //            case .failure(let error):
        //                print("Failed to load drawns: \(error)")
        //            }
        //        }
        
        return journeysArray
    }
    
    private func updateImaginative() {
        //        if let journeyIndex = imaginativeJourneysArray.firstIndex(where: { $0.id == currentJourney.id}) {
        //            let journey = currentJourney as! ImaginativeJourney
        //            imaginativeJourneysArray[journeyIndex] = journey
        //        }
    }
    
    private func updateObservative() {
        //        if let journeyIndex = observativeJourneysArray.firstIndex(where: { $0.id == currentJourney.id}) {
        //            observativeJourneysArray[journeyIndex] = currentJourney
        //        }
    }
    
}


