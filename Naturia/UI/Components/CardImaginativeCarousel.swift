//
//  CardCarousel.swift
//  Naturia
//
//  Created by lrsv on 04/04/23.
//

import Foundation
import SwiftUI

struct CardImaginativeCarousel: View {
    
    @Binding var index: Int
    let journeys: [ImaginativeJourney]
    let onTapArrowLeft: () -> Void
    let onTapArrowRight: () -> Void
    
    var body: some View {
        
        TabView(selection: $index) {
            ZStack() {
                ForEach(journeys.indices, id: \.self) { i in
                    if i == index {
                        CardImaginative(journeyTitle: "Jornada Criativa", journeyProvocation: journeys[i].mainProvocation, journeyImage: journeys[i].imageReference)
                    }
                    
                }
                HStack {
                    Button("<") {
                        onTapArrowLeft()
                    }
                    .font((.system(size: 40)))
                    Spacer()
                    Button(">") {
                        onTapArrowRight()
                    }
                    .font((.system(size: 40)))
                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

//struct CardCarousel_Previews: PreviewProvider {
//    static var previews: some View {
//        CardImaginativeCarousel(index: 0, journeys: [ImaginativeJourney.getPlaceholderImaginativeJourney(isJourneyDone: false), ImaginativeJourney.getPlaceholderImaginativeJourney(isJourneyDone: false), ImaginativeJourney.getPlaceholderImaginativeJourney(isJourneyDone: false)], onTapArrowLeft: test, onTapArrowRight: test)
//    }
//    
//    static func test() {
//        
//    }
//}
