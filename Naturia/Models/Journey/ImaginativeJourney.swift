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
    
    init(mainProvocation: String,
         drawingProvocations: [String],
         mainTrivia: String,
         imageReference: Image,
         plant: Plant,
         name: String,
         isCompleted: Bool
    ){
        self.mainProvocation = mainProvocation
        self.drawingProvocations = drawingProvocations
        self.mainTrivia = mainTrivia
        self.imageReference = imageReference
        super.init(name:  name, plant: plant , isCompleted: isCompleted)
    }
    
}



extension ImaginativeJourney {
    
    static func getPlaceholderImaginativeJourney(isJourneyDone: Bool) -> ImaginativeJourney {
        if isJourneyDone {
            
            let model = ImaginativeJourney(
                mainProvocation: "Algumas pessoas dizem que por ser uma trepadeira muito forte, por vezes a planta com seus grossos caules podem enforcar a árvore onde ela se apoia, assim como a cobra jiboia.",
                drawingProvocations: [
                    "Por que você acredita que uma planta se chamaria Jibioa?",
                    "Qual seria o tamanho dela?",
                    "Ela teria formato específico?"],
                mainTrivia: "Algumas pessoas dizem que por ser uma trepadeira muito forte, por vezes a planta com seus grossos caules podem enforcar a árvore onde ela se apoia, assim como a cobra jiboia.",
                imageReference: Image("jiboiaReferencia"),
                plant: Plant.getPlaceholderPlant(),
                name: "Jiboia",
                isCompleted: true)
            model.userDrawns = [
                Drawn(image: Image("DesenhoCriativo"), type: .imaginative),
                Drawn(image: Image("desenhoUsuario"), type: .observative)
            ]
            
            return model
            
        } else {
            
            return ImaginativeJourney(
                mainProvocation: "Eita!.",
                drawingProvocations: [
                    "Por que você acredita que uma planta se chamaria Jibioa?",
                    "Qual seria o tamanho dela?",
                    "Ela teria formato específico?"],
                mainTrivia: "Algumas pessoas dizem que por ser uma trepadeira muito forte, por vezes a planta com seus grossos caules podem enforcar a árvore onde ela se apoia, assim como a cobra jiboia.",
                imageReference: Image("jiboiaReferencia"),
                plant: Plant.getPlaceholderPlant(),
                name: "Jiboia",
                isCompleted: false
            )
        }
        
        
    }
    
    
    
}
