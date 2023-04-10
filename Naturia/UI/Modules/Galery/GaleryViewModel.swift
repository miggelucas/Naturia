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
            return journeys.isEmpty ? .empty : .content
            
        case .draws:
            return journeys.isEmpty ? .empty : .content
        }
    }
    
    init(journeys: [Journey] = [
        ObservativeJourney.genericPlaceholderObservativeJourney(isDone: false),
        ObservativeJourney.genericPlaceholderObservativeJourney(isDone: true),
        ImaginativeJourney.getPlaceholderImaginativeJourney(isJourneyDone: true),
        ImaginativeJourney.getPlaceholderImaginativeJourney(isJourneyDone: false),
        ObservativeJourney.genericPlaceholderObservativeJourney(isDone: false),
        ObservativeJourney.genericPlaceholderObservativeJourney(isDone: true),
        ImaginativeJourney.getPlaceholderImaginativeJourney(isJourneyDone: true),
        ImaginativeJourney.getPlaceholderImaginativeJourney(isJourneyDone: false),
        ObservativeJourney.genericPlaceholderObservativeJourney(isDone: false),
        ObservativeJourney.genericPlaceholderObservativeJourney(isDone: true),
        ImaginativeJourney.getPlaceholderImaginativeJourney(isJourneyDone: true),
        ImaginativeJourney.getPlaceholderImaginativeJourney(isJourneyDone: false),
        ObservativeJourney.genericPlaceholderObservativeJourney(isDone: false),
        ObservativeJourney.genericPlaceholderObservativeJourney(isDone: true),
        ImaginativeJourney.getPlaceholderImaginativeJourney(isJourneyDone: true),
        ImaginativeJourney.getPlaceholderImaginativeJourney(isJourneyDone: false)
    ], mode: GaleryViewModel.Mode = .plants) {
        self.journeys = journeys
        self.mode = mode
    }
    
    func backButtonPressed() {
        navigationManager!.path.removeLast()
    }
    
    func jorneyPressed(for jorney: Journey) {
        navigationManager!.path.append(jorney)
    }
    
    func drawnPressed(for drawCard: CardGaleryDrawn) {
        navigationManager!.path.append(drawCard)
    }
    
    func rightArrowPressed() {
        self.mode = .draws
    }
    
    func leftArrowPressed() {
        self.mode = .plants
    }
}
