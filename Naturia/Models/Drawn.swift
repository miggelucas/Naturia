//
//  Drawn.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 30/03/23.
//

import Foundation
import SwiftUI

struct Drawn {
    
    enum DrawnType {
        case imaginative, observative
    }
    
    let id: UUID = UUID()
    let creationDate : Date = Date()
    var image: Image
    var type: DrawnType
    
}
