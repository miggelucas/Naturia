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
                TabView(selection: $index) {
                    ZStack() {
                        ForEach((0..<3), id: \.self) { index in
                            HStack(alignment: .top) {
                                VStack(alignment: .leading) {
                                    Text("Jornada criativa")
                                        .font(.custom("Montserrat", size: 20))
                                    Spacer().frame(height: Responsive.scaleHeight(s: 24))
                                    Text("Provocação Escrita em três linhas")
                                        .font(.custom("QuisasStandard-Regular", size: 96))
                                        ._lineHeightMultiple(0.6)
                                        .lineLimit(3)
                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: Responsive.scaleWidth(s: 96)))
                                }
                                Spacer()
                                Image("plant")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: Responsive.scaleWidth(s: 248), height: Responsive.scaleHeight(s: 350))
                                    
                            }
                            .padding(EdgeInsets(top: Responsive.scaleHeight(s: 48), leading: Responsive.scaleWidth(s: 80), bottom: 0, trailing: Responsive.scaleWidth(s: 8)))
                            .background(Color.white)
                        }
                        HStack {
                            Button("<") {

                            }
                            .font((.system(size: 40)))
                            .background(Color.black)
                            Spacer()
                            Button(">") {

                            }
                            .font((.system(size: 40)))
                            .background(Color.black)
                        }
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: Responsive.scaleHeight(s: 56), trailing: 0))
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))

                
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
        .padding(EdgeInsets(top: Responsive.scaleHeight(s: 110), leading: Responsive.scaleWidth(s: 136), bottom: Responsive.scaleHeight(s: 110), trailing: Responsive.scaleWidth(s: 136)))
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
