//
//  Drawn.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 30/03/23.
//

import Foundation
import SwiftUI

struct Drawn: Hashable {
    
    enum DrawnType {
        case imaginative, observative
    }
    
    let id: UUID = UUID()
    let creationDate : Date = Date()
    var image: Image
    var type: DrawnType
    
    
    // Implementação do protocolo Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Drawn, rhs: Drawn) -> Bool {
        lhs.id == rhs.id
    }
}

extension Drawn {
    static func DrawnPlaceholder(type: DrawnType) -> Drawn {
        switch type {
        case .imaginative:
           return Drawn(image: Image("DesenhoCriativo"), type: .imaginative)
            
            
        case .observative:
            return Drawn(image: Image("desenhoUsuario"), type: .observative)
        }
        
        
    }
    
}
