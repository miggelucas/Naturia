//
//  ObservatoryRepositoryViewModel.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 03/04/23.
//

import Foundation
import SwiftUI

class ObservatoryRepositoryViewModel: ObservableObject {
    
    enum state {
        case empty, content
    }
    
    var state: state {
        if jouneys.isEmpty {
            return .empty
        } else {
            return .content
        }
    }
    
    init(journeyArray: [ObservativeJourney] = []) {
        self.jouneys = journeyArray
    }
    
    
    let jouneys: [ObservativeJourney]
    
    func backButtonPressed() {
        print("user pressed to go back to homeScreen")
    }
    
    func journeyPressed(_ journey: ObservativeJourney) {
        print("User pressed in jorney \(journey.name)")
    }
}
