//
//  Responsive.swift
//  Naturia
//
//  Created by lrsv on 30/03/23.
//

import Foundation
import SwiftUI

class Responsive {
    static func scaleWidth(s: Double) -> Double {
        return UIScreen.main.bounds.size.width * s / 1194
    }
    
    static func scaleHeight(s: Double) -> Double {
        return UIScreen.main.bounds.size.height * s / 834
    }
}
