//
//  ScreenshotView.swift
//  Naturia
//
//  Created by ditthales on 27/04/23.
//

import SwiftUI

struct ScreenshotView: View {
    
    let imaginativeDrawn: Image
    let observativeDrawn: Image
    
    var body: some View{
        ZStack{
            BackgroundView(illustrationType: .review)
            VStack (spacing: 48) {
                Text("Jornada Criativa")
                    .font(Font.NaturiaPrimary(.h2))
                Text(RepositoryManager.shared.currentJourney.plant.popularName)
                    .font(Font.NaturiaSecundary(.Subtitle))
                    .padding(.top, -24)
                HStack {
                    VStack(spacing: 16) {
                        ZStack {
                            imaginativeDrawn
                                .resizable()
                            Image("cardImage")
                                .resizable()
                        }
                        .frame(width: 468, height: 325)
                        Text("O que você imaginou")
                            .font(Font.NaturiaSecundary(.h5))
                        
                    }
                    Spacer()
                    Image("iconSetaDireita")
                        .padding(.bottom, 40.0)
                    Spacer()
                    VStack(spacing: 16) {
                        ZStack {
                            observativeDrawn
                                .resizable()
                            Image("cardImage")
                                .resizable()
                        }
                        .frame(width: 468, height: 325)
                        Text("Seu desenho da planta")
                            .font(Font.NaturiaSecundary(.h5))
                    }
                }
                
                HStack{
                    Spacer()
                    HStack(alignment: .center, spacing: 30){
                        Image("Logo")
                            .resizable()
                            .frame(width: 76, height: 76)
                            .padding(.top, 50)
                        Text("NATURIA")
                            .font(.NaturiaPrimary(.h1))
                    }.padding(.top, 48)
                }
            }
            .frame(width: 874)
            
        }.frame(width: 1130)
    }
}

struct ScreenshotView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenshotView(imaginativeDrawn: Image("DesenhoCriativo"), observativeDrawn: Image("desenhoUsuario")).previewInterfaceOrientation(.landscapeLeft)
    }
}
