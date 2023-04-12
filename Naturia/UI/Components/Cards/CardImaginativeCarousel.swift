//
//  CardCarousel.swift
//  Naturia
//
//  Created by lrsv on 04/04/23.
//

import Foundation
import SwiftUI

struct ChildComponentSizePreferenceKey: PreferenceKey {
    typealias Value = CGSize
    
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

struct CardImaginativeCarousel: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    @Binding var index: Int
    let journeys: [ImaginativeJourney]
    let onTapArrowLeft: () -> Void
    let onTapArrowRight: () -> Void
    //    let onTapButton: () -> Void
    @State private var childComponentSize: CGSize = .zero
    
    var body: some View {
        TabView(selection: $index) {
            ForEach(journeys.indices, id: \.self) { i in
                CardImaginative(
                    journeyProvocation: journeys[i].mainProvocation,
                    journeyImage: Image(journeys[i].iconPath), cardIndex: i)
                
                .background(GeometryReader { geometry in
                    Color.clear
                        .preference(key: ChildComponentSizePreferenceKey.self, value: geometry.size)
                })
                .onPreferenceChange(ChildComponentSizePreferenceKey.self) { size in
                    self.childComponentSize = size
                }
                .overlay(
                    VStack() {
                        HStack {
                            ArrowButton(buttonType: .left, onTap: onTapArrowLeft)
                                .padding(.leading, Responsive.scaleWidth(s: -25))
                            Spacer()
                            ArrowButton(buttonType: .right, onTap: onTapArrowRight)
                                .padding(.trailing, Responsive.scaleWidth(s: -25))
                        }
                    }
                )
                .overlay(
                    CTAButton(buttonType: .desenhar, actionForButton: {
                        navigationManager.currentJourney = journeys[index]
                        navigationManager.path.append(Routes.canvas)
                    })
                    .padding(.bottom, Responsive.scaleHeight(s: -24.5)), alignment: .bottom)
                
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .frame(width: childComponentSize.width + Responsive.scaleWidth(s: 58), height: childComponentSize.height + Responsive.scaleHeight(s: 50))
    }
}

struct CardCarousel_Previews: PreviewProvider {
    static var previews: some View {
        StatefulPreviewWrapper(0) {
            CardImaginativeCarousel(index: $0,
                                    journeys: ImaginativeJourney.getImaginativeJourneys(),
                                    onTapArrowLeft: test,
                                    onTapArrowRight: test)
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
