//
//  Journey.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 19/06/23.
//

import Foundation

protocol Journey {
    var id: String { get }
    var plant: Plant { get set }
    var drawingProvocations: [String] { get }
    
}
