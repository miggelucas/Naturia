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
    
    var plants: [Plant]
    var drawns: [Drawn] = []
    
    var state: State {
        switch mode {
        case .plants:
            return plants.isEmpty ? .empty : .content
            
        case .draws:
            return drawns.isEmpty ? .empty : .content
        }
    }
    
    init(plants: [Plant] = RepositoryManager.shared.plants,
         mode: GaleryViewModel.Mode = .plants) {
        
        self.plants = plants
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
