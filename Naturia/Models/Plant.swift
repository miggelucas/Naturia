//
//  Plant.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 30/03/23.
//

import Foundation
import SwiftUI

struct Plant {
    let popularName: String
    let scientificName: String
    let origin: String
    let image: Image
    let plantIcon: Image
    let description: String
    let trivia: [String]
}


extension Plant {
    static func getPlaceholderPlant() -> Plant {
        
        let plantIconImage: [Image] = [
            Image("Red Plant"),
            Image("Green Plant"),
            Image("Violet Plant")
        ]
        
        return Plant(popularName: "Jiboia",
                     scientificName: "Epipremnum pinnatum",
                     origin: "Ilhas Salomão",
                     image: Image("jiboia"),
                     plantIcon: plantIconImage.randomElement()!,
                     description: "A espécie é uma trepadeira sarmentosa, crescendo até 10 m de comprimento, com flores insignificantes e propagação por estaquia de ramos. É uma espécie de planta folhosa",
                     trivia: ["Muito resistente, a hera-do-diabo não requer grandes cuidados, pelo que é bastante utilizada em escritórios, lojas e outros locais públicos",
                              "Só necessário regá-la quando a terra está seca",
                              "adapta-se facilmente a temperaturas entre 17 °C e 30 °C"])
    }
    
}
