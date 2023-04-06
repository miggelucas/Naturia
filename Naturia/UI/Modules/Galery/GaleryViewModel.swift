//
//  GaleryViewModel.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 05/04/23.
//

import Foundation

class GaleryViewModel: ObservableObject {
    
    enum Mode {
        case plants, draws
    }
    
    enum State {
        case empty, content
    }
    
    init(journeys: [Journey], mode: GaleryViewModel.Mode = .plants) {
        self.journeys = journeys
        self.mode = mode
    }
        
    
    let journeys: [Journey]
    
    
    var completedJourneys: [Journey] {
        journeys.filter { journey in
            journey.isCompleted
        }
    }
    
    var mode: Mode
    
    var state: State {
        switch mode {
        case .plants:
            return journeys.isEmpty ? .empty : .content
            
        case .draws:
            return .empty
        }
    }
 
    
    
    func itemPressed() {
        
    }
}
