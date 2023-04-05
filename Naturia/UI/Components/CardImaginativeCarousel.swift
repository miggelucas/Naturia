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
    let onTapButton: () -> Void
    
    var body: some View {
        TabView(selection: $index) {
            ForEach(journeys.indices, id: \.self) { i in
                if i == index {
                    CardImaginative(
                        journeyTitle: "Jornada Criativa",
                        journeyProvocation: journeys[i].mainProvocation,
                        journeyImage: journeys[i].imageReference)
                    .overlay(
                        VStack() {
                            HStack {
                                ArrowButton(buttonType: .left, onTap: onTapArrowLeft)
                                Spacer()
                                ArrowButton(buttonType: .right, onTap: onTapArrowRight)
                            }
                        }
                    )
                    .overlay(
                        CTAButton(cardType: .desenhar, actionForButton: onTapButton), alignment: .bottom)
                }
            }
        }
        
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct CardCarousel_Previews: PreviewProvider {
    static var previews: some View {
        StatefulPreviewWrapper(0) {
            CardImaginativeCarousel(index: $0, journeys: [ImaginativeJourney.getPlaceholderImaginativeJourney(isJourneyDone: false), ImaginativeJourney.getPlaceholderImaginativeJourney(isJourneyDone: false), ImaginativeJourney.getPlaceholderImaginativeJourney(isJourneyDone: false)], onTapArrowLeft: test, onTapArrowRight: test, onTapButton: test)
        }
    }
    
    static func test () {
        
    }
}

struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State var value: Value
    var content: (Binding<Value>) -> Content
    
    var body: some View {
        content($value)
    }
    
    init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
        self._value = State(wrappedValue: value)
        self.content = content
    }
}
