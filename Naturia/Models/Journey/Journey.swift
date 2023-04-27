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
    var isCompleted: Bool
    let drawingProvocations: [String]
    var userDrawns: [Drawn] = []
    
    init(plant: Plant,
         isCompleted: Bool = false,
         drawingProvocations: [String] = ["Você percebe algum padrão nessa planta?",
                                          "Existe alguma característica única nela?",
                                          "Como essa planta esta? "]
    ) {
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
            Journey(plant: Plant.getPlant(popularName: "Pitangueira")!, isCompleted: false),
            Journey(plant: Plant.getPlant(popularName: "Pau-Brasil")!, isCompleted: false),
            Journey(plant: Plant.getPlant(popularName: "Vitória-régia")!, isCompleted: false),
            Journey(plant: Plant.getPlant(popularName: "Ipê-amarelo")!, isCompleted: false),
            Journey(plant: Plant.getPlant(popularName: "Mandacaru")!, isCompleted: false),
            Journey(plant: Plant.getPlant(popularName: "Brinco-de-princesa")!, isCompleted: false),
        ]
    }
    
    static func getObservativePlaceholder() -> Journey {
        let journey = Journey(plant: Plant.getPlant(popularName: "Pitangueira")!,
                              isCompleted: true
        )
        let drawn: [Drawn] = [Drawn.DrawnPlaceholder(type: .observative)]
        
        journey.userDrawns = drawn
        
        return journey
        
    }
}
