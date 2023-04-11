//
//  ImaginativeJourney.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 30/03/23.
//

import Foundation
import SwiftUI

class ImaginativeJourney: Journey {
    
    let mainProvocation: String
    let mainTrivia: String
    
    init(mainProvocation: String,
         drawingProvocations: [String],
         mainTrivia: String,
         plant: Plant,
         isCompleted: Bool
    ) {
        self.mainProvocation = mainProvocation
        self.mainTrivia = mainTrivia
        super.init(plant: plant, isCompleted: isCompleted, drawingProvocations: drawingProvocations)
    }
}

extension ImaginativeJourney {
    static func getImaginativeJourneys() -> [ImaginativeJourney] {
        return [
            // Mandacaru
            ImaginativeJourney(mainProvocation: "Como deve ser a planta que indica a chuva no sertão?", drawingProvocations: ["Qual característica ela deve ter para habitar o sertão?", "O que tem nessa planta que indica a vinda da chuva?", "Como você imagina que seria o porte dela?"], mainTrivia: Plant.getPlant(popularName: "Mandacaru")!.trivia[0], plant: Plant.getPlant(popularName: "Pitangueira")!, isCompleted: false),
            // Ipê amarelo
            ImaginativeJourney(mainProvocation: "De que jeito deve ser as flores que tem formato de trombeta?", drawingProvocations: ["Como você imagina que é a planta na qual florescem?", "Qual deve ser a cor dela?", "Como será que o formato de trombeta ajuda ela na natureza?"], mainTrivia: Plant.getPlant(popularName: "Ipê-amarelo")!.trivia[0], plant: Plant.getPlant(popularName: "Vitória-régia")!, isCompleted: false),
            // Brinco de princesa
            ImaginativeJourney(mainProvocation: "Como você imagina a aparência da planta brinco de princesa?", drawingProvocations: ["Você acha que essa planta possui flores?", "Qual característica nessa planta você imagina que justifica o seu nome?", "Onde você imagina encontra-la?"], mainTrivia: Plant.getPlant(popularName: "Brinco-de-princesa")!.trivia[0], plant: Plant.getPlant(popularName: "Brinco-de-princesa")!, isCompleted: false)]
    }
    
    static func getPlaceholder() {
        
        var journey = ImaginativeJourney(mainProvocation: "Como deve ser a planta que indica a chuva no sertão?",
                                         drawingProvocations: ["Qual característica ela deve ter para habitar o sertão?", "O que tem nessa planta que indica a vinda da chuva?", "Como você imagina que seria o porte dela?"],
                                         Plant.getPlant(popularName: "Mandacaru")!.trivia[0],
                                         plant: Plant.getPlant(popularName: "Pitangueira")!,
                                         isCompleted: true)
        
        let drawn: [Drawn] = [Drawn.DrawnPlaceholder(type: .observative),
                              Drawn.DrawnPlaceholder(type: .imaginative)
        ]
        
        journey.userDrawns = drawn
        
        return journey
        
        
    }
}
