//
//  NaturiaSecundaryFont.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 04/04/23.
//

import Foundation
import SwiftUI

extension Font {
    public enum NaturiaSecondaryType: String {
        case h3, h4, h5, cta, Subtitle, button, button3, body
    }
    
    static func NaturiaSecundary(_ type: NaturiaSecondaryType) -> Font {
        let fontName: String = "Montserrat"
        
        switch type {
        case .h3:
            return custom(fontName, size: 39).weight(.regular)
        case .h4:
            return custom(fontName, size: 31).weight(.medium)
        case .h5:
            return custom(fontName, size: 20).weight(.medium)
        case .cta:
            return custom(fontName, size: 25).weight(.regular)
        case .Subtitle:
            return custom(fontName, size: 20).weight(.regular)
        case .button:
            return custom(fontName, size: 20).weight(.medium)
        case .button3:
            return custom(fontName, size: 16).weight(.medium)
        case .body:
            return custom(fontName, size: 16).weight(.regular)
        }
        
    }
}
