//
//  Routes.swift
//  Naturia
//
//  Created by lrsv on 29/03/23.
//

import Foundation

enum ImaginativeRoutes: Hashable {
    case canvas, miniInfo, canvasImaginative2, review, plantsInfo

}

enum ObservativeRoutes: Hashable {
    case observativeRepository, confirmation, canvas, conquer, plants
    
}

enum GaleryRoutes: Hashable {
    case galery, plantInfo, drawn(CardGaleryDrawn)
}


