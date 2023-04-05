//
//  ObservativeJourney.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 30/03/23.
//

import Foundation
import SwiftUI

class ObservativeJourney: Journey {
    
    let imageQuest: Image
    
    init(imageQuest: Image,
         plant: Plant,
         name: String,
         isCompleted: Bool
    ){
        self.imageQuest = imageQuest
        super.init(name: name, plant: plant , isCompleted: isCompleted, userConcreteDrawn: nil)
        
    }
    
    
    // Implementação do protocolo Hashable
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(name)
//    }
//
//    static func == (lhs: ObservativeJourney, rhs: ObservativeJourney) -> Bool {
//        lhs.name == rhs.name
//    }
    
}

// placeholder for Previews and test
extension ObservativeJourney {
    static func genericPlaceholderObservativeJourney(isDone: Bool) -> ObservativeJourney {
        if isDone {
            let model = ObservativeJourney(
                imageQuest: Image("jiboiaReferencia"),
                plant: Plant.getPlaceholderPlant(),
                name: "Jiboia",
                isCompleted: true)
            model.userConcreteDrawn = Drawn(image: Image("desenhoUsuario"))
            
            return model
            
        } else {
            return ObservativeJourney(
                imageQuest: Image("jiboiaReferencia"),
                plant: Plant.getPlaceholderPlant(),
                name: "Jiboia",
                isCompleted: false)
        }
    }
    
    static func placeholderObservativeJourney(name: String, isDone: Bool = false) -> ObservativeJourney {
        if isDone {
            let model = ObservativeJourney(
                imageQuest: Image("jiboiaReferencia"),
                plant: Plant.getPlaceholderPlant(),
                name: name,
                isCompleted: true)
            
            model.userConcreteDrawn = Drawn(image: Image("desenhoUsuario"))
            
            return model
            
        } else {
            return ObservativeJourney(
                imageQuest: Image("jiboiaReferencia"),
                plant: Plant.getPlaceholderPlant(),
                name: name,
                isCompleted: false)
        }
    }
    
}
