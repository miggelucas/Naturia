//
//  ArrowButton.swift
//  Naturia
//
//  Created by lrsv on 05/04/23.
//

import Foundation
import SwiftUI

struct ArrowButton: View {
    
    enum ButtonType {
        case left, right
    }
    
    let buttonType: ButtonType
    let onTap: () -> Void
    
    
    var body: some View {
        Button {
            onTap()
        } label: {
            ZStack {
                switch buttonType {
                case .left:
                    Image("arrowButtonLeft")
                case .right:
                    Image("arrowButtonRight")
                }
            }
            .frame(width: Responsive.scaleWidth(s: 58), height: Responsive.scaleHeight(s: 56))
        }
        
    }
}

struct ArrowButton_Previews: PreviewProvider {
    static var previews: some View {
        ArrowButton(buttonType: .left, onTap: {})
    }
}
