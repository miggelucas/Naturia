//
//  ObservativeJourney.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 30/03/23.
//

import Foundation
import SwiftUI

class ObservativeJouney: Journey {
    let imageQuest: Image

    init(imageQuest: Image,
         plant: Plant,
         name: String,
         isCompleted: Bool
    ){
        self.imageQuest = imageQuest
        super.init(name: name, plant: plant , isCompleted: isCompleted)

    }
    
}
