//
//  ImaginativeJourney.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 30/03/23.
//

import Foundation
import SwiftUI

class ImaginativeJourney: Journey {
    var id: String
    
    var plant: Plant
    
    var isCompleted: Bool
    
    var drawProvocations: [String]
    
    
    let mainProvocation: String
    let mainTrivia: String
    let iconPath: String
    
    init(mainProvocation: String,
         drawingProvocations: [String],
         mainTrivia: String,
         id: String,
         plant: Plant,
         isCompleted: Bool = false,
         iconPath: String
    ) {
        self.id = id
        self.plant = plant
        self.isCompleted = isCompleted
        self.drawProvocations = drawingProvocations
        self.mainProvocation = mainProvocation
        self.mainTrivia = mainTrivia
        self.iconPath = iconPath
    
    }
}

extension ImaginativeJourney {
    static func getImaginativeJourneys() -> [ImaginativeJourney] {
        return [
            // Mandacaru
            ImaginativeJourney(mainProvocation: "Como deve ser a planta que indica a chuva no sertão?", drawingProvocations: ["Qual característica ela deve ter para habitar o sertão?", "O que tem nessa planta que indica a vinda da chuva?", "Como você imagina que seria o porte dela?"], mainTrivia: "O Mandacaru, um tipo de cacto. Segundo a música interpretada por Luiz Gonzaga: “Mandacaru, quando flora lá na seca é o sinal que a chuva chega no sertão”. Essa crença popular que o processo de floração da planta é o prenuncio da chegada das chuvas no sertão não tem comprovação científica, mas a música tem forte influência na cultura do local.", id: "i1", plant: Plant.getPlant(popularName: "Mandacaru")!, isCompleted: false, iconPath: "Guarda chuva Completo"),
            // Ipê amarelo
            ImaginativeJourney(mainProvocation: "De que jeito deve ser as flores que tem formato de trombeta?", drawingProvocations: ["Como você imagina que é a planta na qual florescem?", "Qual deve ser a cor dela?", "Como será que o formato de trombeta ajuda ela na natureza?"], mainTrivia: "O Ipê Amarelo é conhecido como a 'árvore da vida' por sua beleza e longevidade. Seu nome se deve à coloração amarela das suas flores, que variam desde o amarelo-claro até o amarelo-ouro intenso em formato de trombeta.", id: "i2", plant: Plant.getPlant(popularName: "Vitória-régia")!, isCompleted: false, iconPath: "Trombeta Completa"),
            // Brinco de princesa
            ImaginativeJourney(mainProvocation: "Como você imagina a aparência da planta brinco de princesa?", drawingProvocations: ["Você acha que essa planta possui flores?", "Qual característica nessa planta você imagina que justifica o seu nome?", "Onde você imagina encontra-la?"], mainTrivia: "A planta Brinco-de-princesa, que tem seu nome derivado da aparência das suas flores, que lembram pequenos brincos delicados e elegantes, como aqueles usados por princesas. A planta é conhecida por seus ramos longos e finos que produzem flores em formato de sino, com pétalas coloridas e uma estrutura central que se assemelha a um brinco.", id: "i3", plant: Plant.getPlant(popularName: "Brinco-de-princesa")!, isCompleted: false, iconPath: "Brinco Completo")]
    }
    
    static func getPlaceholder() -> ImaginativeJourney {
        
        let journey = ImaginativeJourney(mainProvocation: "Como deve ser a planta que indica a chuva no sertão?",
                                         drawingProvocations: ["Qual característica ela deve ter para habitar o sertão?", "O que tem nessa planta que indica a vinda da chuva?", "Como você imagina que seria o porte dela?"],
                                         mainTrivia: Plant.getPlant(popularName: "Mandacaru")!.trivia[0], id: "i1",
                                         plant: Plant.getPlant(popularName: "Pitangueira")!,
                                         isCompleted: true,
                                         iconPath: "Guarda chuva Completo")
        
        let drawn: [Drawn] = [Drawn.DrawnPlaceholder(type: .observative),
                              Drawn.DrawnPlaceholder(type: .imaginative)
        ]
        
//        journey.userDrawns = drawn
        
        return journey
        
        
    }
}
