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
    
    init(journeys: [Journey] = Journey.getObservativeJourneys(), mode: GaleryViewModel.Mode = .plants) {
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
            safeNavManger.pushToPath(journey)
        }
    }
    
    func drawnPressed(for drawCard: CardGaleryDrawn) {
        if let safeNavManger = navigationManager {
            safeNavManger.pushToPath(drawCard)
        }
    }
    
    func rightArrowPressed() {
        self.mode = .draws
    }
    
    func leftArrowPressed() {
        self.mode = .plants
    }
}
