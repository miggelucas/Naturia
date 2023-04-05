//
//  GaleryViewModel.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 05/04/23.
//

import Foundation

class GaleryViewModel: ObservableObject {
    
    let journeys: [Journey] = [ObservativeJourney.genericPlaceholderObservativeJourney(isDone: false),
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
                               ImaginativeJourney.getPlaceholderImaginativeJourney(isJourneyDone: false)]
    
    
    var completedJourneys: [Journey] {
        journeys.filter { journey in
            journey.isCompleted
        }
    }
    
    
    func itemPressed() {
        
    }
}
