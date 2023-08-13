//
//  GaleryViewModel.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 05/04/23.
//

import Foundation
import SwiftUI

class GaleryViewModel: ObservableObject {

    let navigationManager = NavigationManager.shared
    let repositoryManager = RepositoryManager.shared
    
    enum ContentMode {
        case plants, draws
    }
    
    enum State {
        case empty, content
    }
    
    @Published var mode: ContentMode
    
    
    init(journeys: [Journey] = RepositoryManager.shared.loadJourneysDrawns(), mode: GaleryViewModel.ContentMode) {
        self.journeys = journeys
        self.mode = mode
    }
    
    var journeys: [Journey]
    
    var completedJourneys: [Journey] {
        journeys.filter { journey in
            journey.isCompleted
        }
    }
    
    var journeysPlants: [Plant] {
        var filterPlants: [Plant] = []
        
        for journey in completedJourneys {
            if !filterPlants.contains(where: { $0.popularName == journey.plant.popularName }) {
                filterPlants.append(journey.plant)
                
            }
        }
        
        return filterPlants
        
    }
    
    var drawns: [Drawn] {
        let journey: Journey = repositoryManager.currentJourney
        return journey.plant.userDrawns
        

        
    }
    
    var state: State {
        switch mode {
        case .plants:
            return completedJourneys.isEmpty ? .empty : .content
            
        case .draws:
            return completedJourneys.isEmpty ? .empty : .content
        }
    }
    

    
    func backButtonPressed() {
            navigationManager.backToPreviousView()
        
    }
    
    func plantPressed(for plant: Plant) {
            RepositoryManager.shared.currentPlant = plant
        navigationManager.pushToPath(GaleryRoutes.plantInfo)
    }
    
    func drawnPressed(for cardDrawn: CardGaleryDrawn) {
            navigationManager.pushToPath(GaleryRoutes.draw(cardDrawn))
        
    }
    
    func rightArrowPressed() {
        self.mode = .draws
    }
    
    func leftArrowPressed() {
        self.mode = .plants
    }
}
