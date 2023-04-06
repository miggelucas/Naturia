//
//  Journey.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 30/03/23.
//

import Foundation
import SwiftUI

class Journey: Hashable {
    let id = UUID()
    let name: String
    let plant: Plant
    let isCompleted: Bool
    var userDrawns: [Drawn] = []
    
    init(name: String, plant: Plant, isCompleted: Bool) {
        self.name = name
        self.plant = plant
        self.isCompleted = isCompleted
    }
    
    // Implementação do protocolo Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Journey, rhs: Journey) -> Bool {
        lhs.id == rhs.id
    }
    
}
