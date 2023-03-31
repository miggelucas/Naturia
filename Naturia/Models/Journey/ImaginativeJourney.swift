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
    let drawingProvocations: [String]
    let mainTrivia: String
    let imageReference: Image
    var userImaginativeDrawn: Drawn?
    
    init(mainProvocation: String,
         drawingProvocations: [String],
         mainTrivia: String,
         imageReference: Image,
         plant: Plant,
         name: String,
         isCompleted: Bool,
         userImaginativeDrawn: Drawn?
    ){
        self.mainProvocation = mainProvocation
        self.drawingProvocations = drawingProvocations
        self.mainTrivia = mainTrivia
        self.imageReference = imageReference
        self.userImaginativeDrawn = userImaginativeDrawn
        super.init(name:  name, plant: plant , isCompleted: isCompleted, userConcreteDrawn: nil)
    }
    
}



extension ImaginativeJourney {
    
    static func getPlaceholderImaginativeJourney() -> ImaginativeJourney {
        ImaginativeJourney(mainProvocation: "Algumas pessoas dizem que por ser uma trepadeira muito forte, por vezes a planta com seus grossos caules podem enforcar a árvore onde ela se apoia, assim como a cobra jiboia.",
                           drawingProvocations: [
                            "Por que você acredita que uma planta se chamaria Jibioa?",
                            "Qual seria o tamanho dela?",
                            "Ela teria formato específico?"],
                           mainTrivia: "Algumas pessoas dizem que por ser uma trepadeira muito forte, por vezes a planta com seus grossos caules podem enforcar a árvore onde ela se apoia, assim como a cobra jiboia.",
                           imageReference: Image("jiboiaReferencia"),
                           plant: Plant.getPlaceholderPlant(),
                           name: "Jiboia",
                           isCompleted: false,
                           userImaginativeDrawn: nil
                           )
    }
    
    static func getPlaceholderImaginativeJourneyCompleted() -> ImaginativeJourney {
        let model = ImaginativeJourney(mainProvocation: "Algumas pessoas dizem que por ser uma trepadeira muito forte, por vezes a planta com seus grossos caules podem enforcar a árvore onde ela se apoia, assim como a cobra jiboia.",
                           drawingProvocations: [
                            "Por que você acredita que uma planta se chamaria Jibioa?",
                            "Qual seria o tamanho dela?",
                            "Ela teria formato específico?"],
                           mainTrivia: "Algumas pessoas dizem que por ser uma trepadeira muito forte, por vezes a planta com seus grossos caules podem enforcar a árvore onde ela se apoia, assim como a cobra jiboia.",
                           imageReference: Image("jiboiaReferencia"),
                           plant: Plant.getPlaceholderPlant(),
                           name: "Jiboia",
                           isCompleted: true,
                           userImaginativeDrawn: Drawn(image: Image("desenhoCriativo"))
                           )
        
        model.userConcreteDrawn = Drawn(image: Image("desenhoUsuario"))
        return model
    }
    
    
}
