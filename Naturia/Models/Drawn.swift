//
//  Drawn.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 30/03/23.
//

import Foundation
import SwiftUI

struct Drawn: Hashable, Identifiable {
    
    enum DrawnType {
        case imaginative, observative
    }
    
    let id: UUID
    let journeyId: String
    let plantName: String
    let creationDate: Date
    var image: Image
    var type: DrawnType
    
    init(id: UUID = UUID(), journeyId: String, plantName: String, creationDate: Date = Date(), image: Image, type: DrawnType) {
        self.id = id
        self.journeyId = journeyId
        self.plantName = plantName
        self.creationDate = creationDate
        self.image = image
        self.type = type
    }
    
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
            return Drawn(journeyId: "x1", plantName: "exemplo", image: Image("DesenhoCriativo"), type: .imaginative)


        case .observative:
            return Drawn(journeyId: "x2", plantName: "exemplo", image: Image("desenhoUsuario"), type: .observative)
        }


    }

}
