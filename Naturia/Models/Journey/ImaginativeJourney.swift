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
    let mainTrivia: [String]
    let imageReference: Image
    var userImaginativeDrawn: Drawn?
    
    init(mainProvocation: String,
         drawingProvocations: [String],
         mainTrivia: [String],
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
