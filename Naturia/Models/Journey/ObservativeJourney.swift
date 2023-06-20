//
//  Journey.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 30/03/23.
//

import Foundation
import SwiftUI

class ObservativeJourney: Journey, Hashable, Identifiable {
    var id: String
    var plant: Plant

    var drawingProvocations: [String]
    var userDrawns: [Drawn] = []
    
    init(id: String,
         plant: Plant,
         drawingProvocations: [String] = ["Você percebe algum padrão nessa planta?",
                                          "Existe alguma característica única nela?",
                                          "Como essa planta esta? "]
    ) {
        self.id = id
        self.plant = plant
        self.drawingProvocations = drawingProvocations
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
            ObservativeJourney(id: "o1", plant: Plant.getPlant(popularName: "Pitangueira")!),
            ObservativeJourney(id: "o2", plant: Plant.getPlant(popularName: "Pau-Brasil")!),
            ObservativeJourney(id: "o3", plant: Plant.getPlant(popularName: "Vitória-régia")!),
            ObservativeJourney(id: "o4", plant: Plant.getPlant(popularName: "Ipê-amarelo")!),
            ObservativeJourney(id: "o5", plant: Plant.getPlant(popularName: "Mandacaru")!),
            ObservativeJourney(id: "o6", plant: Plant.getPlant(popularName: "Brinco-de-princesa")!),
        ]
    }
    
    static func getObservativePlaceholder() -> ObservativeJourney {
        let journey = ObservativeJourney(id: "o1",
                              plant: Plant.getPlant(popularName: "Pitangueira")!
        )
        let drawn: [Drawn] = [Drawn.DrawnPlaceholder(type: .observative)]
        
        journey.userDrawns = drawn
        
        return journey
        
    }
}
