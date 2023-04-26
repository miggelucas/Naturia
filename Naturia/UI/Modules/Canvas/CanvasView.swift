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
    
    // tentar devolver essa lógica para viewModel
    
    func getImageData() -> UIImage{
        let drawnSize = viewModel.canvasView.drawing.bounds.size
        let drawnRect = CGRect(origin: .zero, size: drawnSize)
        let drawingImage = viewModel.canvasView.drawing.image(from: drawnRect, scale: 1)
        return drawingImage
    }
    
    func doneButtonPressed() {
        // quebrar esse metodo em partes
        // chamar um método que aplica a lógica abaixo
        let receivedJourney = RepositoryManager.shared.currentJourney
                
        var typeOfJourney: Drawn.DrawnType {
            if viewModel.canvasRole == .imaginative1 {
                return .imaginative
            } else {
                return .observative
            }
        }
    

        viewModel.userDraw = getImageData()
        let newDrawn: Drawn = Drawn(image: Image(uiImage: viewModel.userDraw), type: typeOfJourney)
        receivedJourney.userDrawns.append(newDrawn)
        
        RepositoryManager.shared.currentJourney = receivedJourney
        
        // então realiza a ação de notificar o navManager para próxima tela
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
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    
    
    
}

struct Canvas_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView(viewModel: CanvasViewModel(canvasRole: .imaginative1)).previewInterfaceOrientation(.landscapeLeft).environmentObject(NavigationManager())
    }
}
