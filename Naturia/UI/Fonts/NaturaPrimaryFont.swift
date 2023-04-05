//
//  NaturaPrimaryFont.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 04/04/23.
//

import Foundation
import SwiftUI

extension Font {
    public enum NaturiaPrimaryType: String {
        case h1, h2
    }
    
    static func NaturiaPrimary(_ type: NaturiaPrimaryType) -> Font {
        let fontName: String = "QuisasStandard-Regular"
        
        switch type{
        case .h1:
            return .custom(fontName, size: 120).weight(.regular)
            
        case .h2:
            return .custom(fontName, size: 96).weight(.regular)
        }
        
    }
}
