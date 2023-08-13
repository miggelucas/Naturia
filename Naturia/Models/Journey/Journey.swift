//
//  Journey.swift
//  Naturia
//
//  Created by Lucas Migge on 12/08/23.
//

import Foundation


protocol Journey {
    var id: String { get }
    var plant: Plant { get set }
    var isCompleted: Bool { get set }
    var drawProvocations: [String] { get }
}
