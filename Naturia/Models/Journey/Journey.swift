//
//  Journey.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 30/03/23.
//

import Foundation
import SwiftUI

class Journey: Hashable {
    let id = UUID()
    let plant: Plant
    let isCompleted: Bool
    let drawingProvocations: [String]
    var userDrawns: [Drawn] = []
    
    init(plant: Plant, isCompleted: Bool = false, drawingProvocations: [String] = [""]) {
        self.plant = plant
        self.isCompleted = isCompleted
        self.drawingProvocations = drawingProvocations
    }
    
    // Implementação do protocolo Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Journey, rhs: Journey) -> Bool {
        lhs.id == rhs.id
    }
}

extension Journey {
    static func getObservativeJourneys() -> [Journey] {
        return [
            // Pitangueira
            Journey(plant: Plant.getPlant(popularName: "Pitangueira")!, isCompleted: false),
            // Pau-Brasil
            Journey(plant: Plant.getPlant(popularName: "Pau-Brasil")!, isCompleted: false),
            // Vitória-régia
            Journey(plant: Plant.getPlant(popularName: "Vitória-régia")!, isCompleted: false),
            // Primavera
            Journey(plant: Plant.getPlant(popularName: "Primavera")!, isCompleted: false)]
    }
    
    static func getObservativePlaceholder() -> Journey {
        var journey = Journey(plant: Plant.getPlant(popularName: "Pitangueira")!,
                              isCompleted: true
        )
        let drawn: [Drawn] = [Drawn.DrawnPlaceholder(type: .observative)]
        
        journey.userDrawns = drawn
        
        return journey
        
    }
}
