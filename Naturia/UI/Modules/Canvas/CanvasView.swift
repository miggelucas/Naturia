//
//  CanvasView.swift
//  Naturia
//
//  Created by ditthales on 28/03/23.
//  
//

import SwiftUI


struct CanvasView: View {
    @ObservedObject private var viewModel: CanvasViewModel
    @EnvironmentObject var navigationManager: NavigationManager
    
    init(viewModel: CanvasViewModel) {
        self.viewModel = viewModel
    }
    
    func getImageData() -> UIImage{
        let drawingImage = viewModel.canvasView.drawing.image(from: CGRect(origin: .zero, size: CGSize(width: 200, height: 200)), scale: 1)
        return drawingImage
    }
    
    func doneButtonPressed() {
        let receivedJourney = navigationManager.currentJourney
                
        var typeOfJourney: Drawn.DrawnType
        if receivedJourney != nil {
            typeOfJourney = .observative
        }else{
            typeOfJourney = .imaginative
        }

        viewModel.userDraw = getImageData()
        let newDrawn: Drawn = Drawn(image: Image(uiImage: viewModel.userDraw), type: typeOfJourney)
        receivedJourney?.userDrawns.append(newDrawn)
        
        navigationManager.currentJourney = receivedJourney
        
        switch viewModel.canvasRole {
        case .imaginative1:
            navigationManager.path.append(Routes.miniInfo)

        case .imaginative2:
            navigationManager.path.append(Routes.review)

        case .observative:
            navigationManager.path.append(Routes.conquista)
        }

    }
    
    var body: some View {
        ZStack(alignment: .topLeading){
            BackgroundView()
            
            DrawingCanvas(canvasView: $viewModel.canvasView)
            
            HStack(alignment: .top, spacing: 0) {
                VStack(alignment: .leading, spacing: 24) {
                    BackButton(style: .back) {
                        viewModel.backButtonPressed()
                    }
                    
                    ExpandableView(viewType: viewModel.toggleType,
                                   provocacoes: $viewModel.provocacoes,
                                   referencia: $viewModel.referencia)
                }
                .padding(.leading, 32)
                .fixedSize()
                
                Spacer()
                
                CTAButton(buttonType: .concluido, actionForButton: {
                    doneButtonPressed()
                })
                .padding(.trailing, 32)
            }
            .padding(.top, 48.0)
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            viewModel.navigationManager = navigationManager
            viewModel.viewDidAppear()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    
    
    
}

struct Canvas_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView(viewModel: CanvasViewModel(canvasRole: .imaginative1)).previewInterfaceOrientation(.landscapeLeft).environmentObject(NavigationManager())
    }
}
