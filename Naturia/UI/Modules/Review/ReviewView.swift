//
//  ReviewView.swift
//  Naturia
//
//  Created by ditthales on 30/03/23.
//  
//

import SwiftUI


struct ReviewView: View, Hashable {
    
    @ObservedObject private var viewModel = ReviewViewModel()
    
    let id: UUID = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: ReviewView, rhs: ReviewView) -> Bool {
        lhs.id == rhs.id
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
                            viewModel.userImaginativeDrawn
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
                            viewModel.userObservativeDrawn
                                .resizable()
                            Image("cardImage")
                                .resizable()
                        }
                        .frame(width: 362, height: 252)
                        Text("Seu desenho da planta")
                            .font(Font.NaturiaSecundary(.h5))
                    }
                }
                
                TextAndConfirmationButtons(cardType: .grande, firstLine: "Parabéns, olha o quanto você aprendeu!", secondLine: "Quer saber mais sobre o/a [nomedaplanta]?", firstButtonType: .sim, secondButtonType: .agoranao, actionForGreenButton: {
                    viewModel.greenButtonPressed()
                }, actionForWhiteButton: {
                    viewModel.whiteButtonPressed()
                })
                .padding(.top, 19)
            }
            .frame(width: 874)
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            viewModel.viewDidApper()
        }
        
        
    }
    
    func getShareImage() -> Image{
        
        guard let image = ImageRenderer(content: ScreenshotView(imaginativeDrawn: viewModel.userImaginativeDrawn, observativeDrawn: viewModel.userObservativeDrawn)).uiImage else{
            return Image("")
        }
        return Image(uiImage: image)
    }
    
}




struct Review_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
