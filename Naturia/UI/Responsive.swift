//
//  Responsive.swift
//  Naturia
//
//  Created by lrsv on 30/03/23.
//

import Foundation
import SwiftUI

class Responsive {
    static func scale(s: Double) -> Double {
        return UIScreen.main.bounds.size.width * s / 834
    }
}
