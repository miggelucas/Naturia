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
    @Published var cardIndex: Int = 0
    @Published var journeys: [ImaginativeJourney]
    
    var navigationManager: NavigationManager?
    
    init() {
        journeys = ImaginativeJourney.getImaginativeJourneys()
    }
    
    func onTapArrowLeft() {
        if (cardIndex > 0) {
            cardIndex = cardIndex - 1
        }
    }
    
    func onTapArrowRight() {
        if (cardIndex < 2) {
            cardIndex = cardIndex + 1
        }
    }
    
    func onTapButton() {
        print("onTapButton CardImaginativeCarouselViewModel")
        if let safeNavManager = navigationManager {
//            safeNavManager.path.append()
            
        }
    }
    
    private func getJourneys() -> [ImaginativeJourney]{
        return ImaginativeJourney.getImaginativeJourneys()
    }
}
