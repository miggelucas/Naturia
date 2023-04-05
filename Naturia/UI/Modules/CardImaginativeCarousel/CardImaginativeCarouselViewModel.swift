//
//  CardImaginativeCarouselViewModel.swift
//  Naturia
//
//  Created by lrsv on 04/04/23.
//  
//

import SwiftUI

// MARK: Variables to watch mark as Published. ViewModel also calls API/Core Data

final class CardImaginativeCarouselViewModel: ObservableObject {
    @Published var model: CardImaginativeModel = CardImaginativeModel()
    
    init() {
        self.model.journeys = getJourneys()
    }
    
    func onTapArrowLeft() {
        if (self.model.cardIndex > 0) {
            self.model.cardIndex = model.cardIndex - 1
            self.objectWillChange.send()
        }
    }
    
    func onTapArrowRight() {
        if (self.model.cardIndex < 2) {
            print("aaa")
            self.model.cardIndex = model.cardIndex + 1
            self.objectWillChange.send()
        }
    }
    
    private func getJourneys() -> [ImaginativeJourney]{
        return [ImaginativeJourney.getPlaceholderImaginativeJourney(isJourneyDone: false), ImaginativeJourney.getPlaceholderImaginativeJourney(isJourneyDone: true),ImaginativeJourney.getPlaceholderImaginativeJourney(isJourneyDone: false)]
    }
}
