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
    @State private var index = 0;
    
    var body: some View {
        VStack {
            VStack {
                CardImaginativeCarouselView()
                
                HStack(alignment: .bottom) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Jornada Observativa")
                                .font(.custom("Montserrat", size: 32))
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: Responsive.scaleHeight(s: 8), trailing: 0))
                            Text("Explore as plantas por análise presencial!")
                                .font(.system(size: Responsive.scaleWidth(s: 20)))
                        }
                        .padding(EdgeInsets(top: Responsive.scaleHeight(s: 32), leading: Responsive.scaleWidth(s: 40), bottom: Responsive.scaleHeight(s: 32), trailing: Responsive.scaleWidth(s: 40)))
        
                    }
                    .background(Color.white)
                    Spacer()
                    HStack {
                        Text("Galeria")
                            .font(.custom("Montserrat", size: 32))
                           
                    }
                    .padding(EdgeInsets(top: Responsive.scaleHeight(s: 55), leading: Responsive.scaleWidth(s: 60), bottom: Responsive.scaleHeight(s: 52), trailing: Responsive.scaleWidth(s: 60)))
                    .background(Color.white)
                }
            }

        }
        .frame(maxHeight: .infinity)
        .background(LinearGradient(
            colors: [Color.gray, Color.brown],
            startPoint: .leading, endPoint: .trailing))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
