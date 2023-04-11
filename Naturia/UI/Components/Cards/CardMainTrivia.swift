//
//  CardMainTrivia.swift
//  Naturia
//
//  Created by acrn on 04/04/23.
//

import SwiftUI

struct CardMainTrivia: View {
    
    var mainTriviaContent: String
    
    var body: some View {
        
        ZStack {
            Image("CardMainTrivia")
               
            
            HStack {
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("O que você desenhou na verdade é...")
                            .font(.NaturiaSecundary(.cta))
                            .fontWeight(.medium)

                    }
                    
                    HStack {
                        Text(mainTriviaContent)
                            .font(.NaturiaSecundary(.body))
                            .fontWeight(.regular)

                    }
                    Spacer()
                }

                Spacer()
            }
            .padding(24)
            
            
        }
        .frame(width: 512, height: 424)
        
       
    }
}

struct CardMainTrivia_Previews: PreviewProvider {
    static var previews: some View {
        CardMainTrivia(mainTriviaContent: "coisinha")
    }
}
