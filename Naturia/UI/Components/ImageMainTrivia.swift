//
//  ImageMainTrivia.swift
//  Naturia
//
//  Created by acrn on 04/04/23.
//

import SwiftUI

struct ImageMainTrivia: View {
    
    var plantImage: Image
    
    
    var body: some View {
    
        ZStack {
            
            plantImage
                .resizable()
            Image("cardImage")
            
        } .frame(width: 330, height: 424)
        
    }
}

struct ImageMainTrivia_Previews: PreviewProvider {
    static var previews: some View {
        ImageMainTrivia(plantImage: Image("jiboia"))
    }
}
