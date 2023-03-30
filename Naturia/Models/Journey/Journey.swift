//
//  Journey.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 30/03/23.
//

import Foundation
import SwiftUI

class Journey {
    let name: String
    let plant: Plant
    let isCompleted: Bool
    var userConcreteDrawn: Drawn?
    
    init(name: String, plant: Plant, isCompleted: Bool) {
        self.name = name
        self.plant = plant
        self.isCompleted = isCompleted
    }
    
}
