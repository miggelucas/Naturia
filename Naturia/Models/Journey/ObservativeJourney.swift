//
//  Journey.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 30/03/23.
//

import Foundation
import SwiftUI

class ObservativeJourney: Journey, Hashable, Identifiable {
    let id: String
    var plant: Plant
    var isCompleted: Bool
    let drawProvocations: [String]
    var userDrawns: [Drawn] = []
    
    init(id: String,
         plant: Plant,
         isCompleted: Bool = false,
         drawingProvocations: [String] = ["Você percebe algum padrão nessa planta?",
                                          "Existe alguma característica única nela?",
                                          "Como essa planta esta?"]
    ) {
        self.id = id
        self.plant = plant
        self.isCompleted = isCompleted
        self.drawProvocations = drawingProvocations
    }
    
    // Implementação do protocolo Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: ObservativeJourney, rhs: ObservativeJourney) -> Bool {
        lhs.id == rhs.id
    }
}


extension ObservativeJourney {
    static func getObservativeJourneys() -> [ObservativeJourney] {
        return [
            ObservativeJourney(id: "o1", plant: Plant.getPlant(popularName: "Pitangueira")!, isCompleted: false),
            ObservativeJourney(id: "o2", plant: Plant.getPlant(popularName: "Pau-Brasil")!, isCompleted: false),
            ObservativeJourney(id: "o3", plant: Plant.getPlant(popularName: "Vitória-régia")!, isCompleted: false),
            ObservativeJourney(id: "o4", plant: Plant.getPlant(popularName: "Ipê-amarelo")!, isCompleted: false),
            ObservativeJourney(id: "o5", plant: Plant.getPlant(popularName: "Mandacaru")!, isCompleted: false),
            ObservativeJourney(id: "o6", plant: Plant.getPlant(popularName: "Brinco-de-princesa")!, isCompleted: false),
        ]
    }
    
    static func getObservativePlaceholder() -> ObservativeJourney {
        let journey = ObservativeJourney(id: "o1",
                              plant: Plant.getPlant(popularName: "Pitangueira")!,
                              isCompleted: true
        )
        let drawn: [Drawn] = [Drawn.DrawnPlaceholder(type: .observative)]
        
        journey.userDrawns = drawn
        
        return journey
        
    }
}
