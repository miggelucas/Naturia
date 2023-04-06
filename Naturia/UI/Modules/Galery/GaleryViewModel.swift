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
    
    @Published var mode: Mode
    
    let journeys: [Journey]
    
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
    
    init(journeys: [Journey], mode: GaleryViewModel.Mode = .draws) {
        self.journeys = journeys
        self.mode = mode
    }
    
    
    func itemPressed() {
        
    }
    
    func rightArrowPressed() {
        self.mode = .draws
    }
    
    func leftArrowPressed() {
        self.mode = .plants
    }
}
