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
    
    enum Mode {
        case plants, draws
    }
    
    enum State {
        case empty, content
    }
    
    @Published var mode: Mode
    
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
        var drawns = [Drawn]()
        
        for journey in completedJourneys {
            print("journey: \(journey.id)")
            for drawn in journey.userDrawns {
                if !drawns.contains(drawn) {
                    print("draw: \(drawn.id)")
                    drawns.append(drawn)
                }
               
            }
        }
        
        return drawns
        
    }
    
    var state: State {
        switch mode {
        case .plants:
            return completedJourneys.isEmpty ? .empty : .content
            
        case .draws:
            return completedJourneys.isEmpty ? .empty : .content
        }
    }
    
    init(journeys: [Journey] = RepositoryManager.shared.loadJourneysDrawns(), mode: GaleryViewModel.Mode = .plants) {
        self.journeys = journeys
        self.mode = mode
    }
    
    func backButtonPressed() {
            navigationManager.backToPreviousView()
        
    }
    
    func plantPressed(for plant: Plant) {
            RepositoryManager.shared.currentPlant = plant
        navigationManager.pushToPath(GaleryRoutes.plantInfo)
    }
    
    func drawnPressed(for cardDrawn: CardGaleryDrawn) {
            navigationManager.pushToPath(GaleryRoutes.drawn(cardDrawn))
        
    }
    
    func rightArrowPressed() {
        self.mode = .draws
    }
    
    func leftArrowPressed() {
        self.mode = .plants
    }
}
