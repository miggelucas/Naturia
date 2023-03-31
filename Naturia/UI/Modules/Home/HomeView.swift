//
//  HomeView.swift
//  Naturia
//
//  Created by lrsv on 29/03/23.
//
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("Jornada criativa")
                            .font(.system(size: Responsive.scaleWidth(s: 20)))
                        Text("Alguma provocação escrita aqui de três linhas")
                            .font(.system(size: Responsive.scaleWidth(s: 60)))
                            .lineLimit(3)
                    }
//                    .background(Color.pink)
                    Spacer(minLength: Responsive.scaleWidth(s: 120))
                    Image("plant")
//                        .background(Color.pink)
                }
                .padding(EdgeInsets(top: Responsive.scaleHeight(s: 48), leading: Responsive.scaleWidth(s: 80), bottom: 0, trailing: Responsive.scaleWidth(s: 8)))
                .frame(maxWidth: .infinity)
                .background(Color.white)
                VStack {
                    HStack {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(Responsive.scaleHeight(s: 160))")
                                    .font(.system(size: Responsive.scaleWidth(s: 32)))
                                Text("Explore as plantas por análise presencial!")
                                    .font(.system(size: Responsive.scaleWidth(s: 20)))
                            }
                            .frame(maxHeight: .infinity)
                            Spacer()
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(EdgeInsets(top: 0, leading: Responsive.scaleWidth(s: 32), bottom: 0, trailing: Responsive.scaleWidth(s: 60)))
                        .background(Color.white)
                        Spacer().frame(width: Responsive.scaleWidth(s: 32))
                        HStack {
                            Text("Catálogo")
                                .font(.system(size: Responsive.scaleWidth(s: 50)))
                        }
                        .padding(EdgeInsets(top: 0, leading: Responsive.scaleWidth(s: 42), bottom: 0, trailing: Responsive.scaleWidth(s: 42)))
                        .frame(maxHeight: .infinity)
                        .background(Color.white)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

                }
                .frame(maxHeight: .infinity)
//                .background(Color.brown)
            }
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .padding(EdgeInsets(top: Responsive.scaleHeight(s: 120), leading: Responsive.scaleWidth(s: 160), bottom: Responsive.scaleHeight(s: 80), trailing: Responsive.scaleWidth(s: 160)))
        .background(LinearGradient(
            colors: [Color(red: 255.0, green: 252.0, blue: 250.0), Color(red: 250.0, green: 241.0, blue: 218.0, opacity: 1)],
            startPoint: .top, endPoint: .bottom))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
