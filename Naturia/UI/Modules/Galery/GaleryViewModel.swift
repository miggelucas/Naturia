//
//  GaleryViewModel.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 05/04/23.
//

import Foundation
import SwiftUI

class GaleryViewModel: ObservableObject {

    var navigationManager: NavigationManager?
    
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
    
    var state: State {
        switch mode {
        case .plants:
            return completedJourneys.isEmpty ? .empty : .content
            
        case .draws:
            return completedJourneys.isEmpty ? .empty : .content
        }
    }
    
    init(journeys: [Journey] = RepositoryManager.shared.getAllJourneys(), mode: GaleryViewModel.Mode = .plants) {
        self.journeys = journeys
        self.mode = mode
    }
    
    func backButtonPressed() {
        if let safeNavManger = navigationManager {
            safeNavManger.backToPreviousView()
        }
    }
    
    func jorneyPressed(for journey: Journey) {
        if let safeNavManger = navigationManager {
            RepositoryManager.shared.currentJourney = journey
            safeNavManger.pushToPath(GaleryRoutes.plantInfo)
        }
    }
    
    func drawnPressed(for cardDrawn: CardGaleryDrawn) {
        if let safeNavManger = navigationManager {
            safeNavManger.pushToPath(GaleryRoutes.drawn(cardDrawn))
        }
    }
    
    func rightArrowPressed() {
        self.mode = .draws
    }
    
    func leftArrowPressed() {
        self.mode = .plants
    }
}
