//
//  CardExpandedDrawn.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 08/04/23.
//

import SwiftUI

struct CardExpandedDrawn: View {
    let drawn: Drawn?
    
    var body: some View {
        ZStack {
//            Image
            Image("CardExpandedDrawn")
                
        }
        .frame(width: 1130, height: 680)
    }
}

struct CardExpandedDrawn_Previews: PreviewProvider {
    static var previews: some View {
        CardExpandedDrawn(drawn: nil).previewInterfaceOrientation(.landscapeLeft)
    }
}
