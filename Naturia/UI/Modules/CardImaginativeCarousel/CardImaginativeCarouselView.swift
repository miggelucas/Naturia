//
//  CardImaginativeCarouselView.swift
//  Naturia
//
//  Created by lrsv on 04/04/23.
//  
//

import SwiftUI

struct CardImaginativeCarouselView: View {
    @ObservedObject private var viewModel = CardImaginativeCarouselViewModel()
    
    var body: some View {
        CardImaginativeCarousel(index: $viewModel.cardIndex, journeys: viewModel.journeys, onTapArrowLeft: viewModel.onTapArrowLeft, onTapArrowRight: viewModel.onTapArrowRight)
            
        
    }
    
    struct CardImaginativeCarousel_Previews: PreviewProvider {
        static var previews: some View {
            CardImaginativeCarouselView()
        }
    }
}
