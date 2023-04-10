//
//  HomeView.swift
//  Naturia
//
//  Created by lrsv on 29/03/23.
//
//

import SwiftUI
import UIKit
struct HomeView: View {
    
    @ObservedObject private var viewModel = HomeViewModel()
    @EnvironmentObject var navigationManager: NavigationManager
    
    @State private var index = 0;
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Spacer()
                VStack {
                    CardImaginativeCarouselView()
                    Spacer().frame(height: Responsive.scaleWidth(s: 56))
                    HStack(alignment: .bottom) {
                        Spacer()
                        CardObservativeHomeView()
                        Spacer().frame(width: Responsive.scaleWidth(s: 32))
                        CardGalleryHomeView()
                        Spacer()
                    }
                }
                Spacer()
            }
            .environmentObject(navigationManager)
        .frame(maxHeight: .infinity)
        }
//        .background(LinearGradient(
//            colors: [Color.gray, Color.brown],
//            startPoint: .leading, endPoint: .trailing))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(NavigationManager())
    }
}
