//
//  ReviewView.swift
//  Naturia
//
//  Created by ditthales on 30/03/23.
//  
//

import SwiftUI

struct ReviewView: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    @ObservedObject private var viewModel = ReviewViewModel()
    
    var userFirstDrawImage: Image{
        if let drawns = navigationManager.currentImaginativeJourney?.userDrawns{
            for drawn in drawns {
                if drawn.type == .imaginative{
                    return drawn.image
                }
            }
        }
        return Image("DesenhoCriativo")
        
    }
    
    var userNewDrawImage: Image{
        if let drawns = navigationManager.currentImaginativeJourney?.userDrawns{
            for drawn in drawns {
                if drawn.type == .observative{
                    return drawn.image
                }
            }
        }
        return Image("desenhoUsuario")
        
    }
    
    var body: some View {
        ZStack {
            
            BackgroundView(illustrationType: .review)
            
            VStack (spacing: 36){
                HStack{
                    Spacer()
                    ShareLink(item: getShareImage(), preview: SharePreview("Seu desenho", image: getShareImage())){
                        SaveButton()
                    }
                }
                HStack {
                    VStack(spacing: 16) {
                        ZStack {
                            userFirstDrawImage
                                .resizable()
                            Image("cardImage")
                                .resizable()
                        }
                        .frame(width: 362, height: 252)
                        Text("O que você imaginou")
                            .font(Font.NaturiaSecundary(.h5))
                    }
                    Spacer()
                    Image("iconSetaDireita")
                        .padding(.bottom, 40.0)
                    Spacer()
                    VStack(spacing: 16) {
                        ZStack {
                            userNewDrawImage
                                .resizable()
                            Image("cardImage")
                                .resizable()
                        }
                        .frame(width: 362, height: 252)
                        Text("Seu desenho da planta")
                            .font(Font.NaturiaSecundary(.h5))
                    }
                }
                
                TextAndConfirmationButtons(cardType: .grande, firstLine: "Parabéns, olha o quanto você aprendeu!", secondLine: "Quer saber mais sobre o/a [nomedaplanta]?", firstButtonType: .sim, secondButtonType: .agoranao, actionForFirstButton: {}, actionForSecondButton: {})
                    .padding(.top, 19)
            }
            .frame(width: 874)
        }
        .onAppear {
            viewModel.navigationManager = navigationManager
        }
    }
    
    var screenshot: some View{
        ZStack {
            BackgroundView(illustrationType: .review)
            HStack {
                VStack(spacing: 16) {
                    ZStack {
                        userFirstDrawImage
                            .resizable()
                        Image("cardImage")
                            .resizable()
                    }
                    .frame(width: 362, height: 252)
                    Text("O que você imaginou")
                        .font(Font.NaturiaSecundary(.h5))
                }
                Spacer()
                Image("iconSetaDireita")
                    .padding(.bottom, 40.0)
                Spacer()
                VStack(spacing: 16) {
                    ZStack {
                        userNewDrawImage
                            .resizable()
                        Image("cardImage")
                            .resizable()
                    }
                    .frame(width: 362, height: 252)
                    Text("Seu desenho da planta")
                        .font(Font.NaturiaSecundary(.h5))
                }
            }
            .frame(width: 874)
        }
    }
    
    func getShareImage() -> Image{
        guard let image = ImageRenderer(content: screenshot).uiImage else{
            return Image("Image")
        }
        return Image(uiImage: image)
    }
    
}

struct Review_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView()
            .previewInterfaceOrientation(.landscapeLeft).environmentObject(NavigationManager())
    }
}
