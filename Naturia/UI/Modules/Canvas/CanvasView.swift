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
    
    init(viewModel: CanvasViewModel) {
        self.viewModel = viewModel
    }
    
    // tentar devolver essa lógica para viewModel
    
    func getImageData() -> UIImage{
        let drawingSize = UIScreen.main.bounds.size
        
        let drawingRect = CGRect(origin: .zero, size: drawingSize)
        let drawingImage = viewModel.canvasView.drawing.image(from: drawingRect, scale: CGFloat(1.0))
        return drawingImage
    }
    
    func doneButtonPressed() {
        // código novo
        var currentPlant = RepositoryManager.shared.currentJourney.plant
        
        var typeOfJourney: Drawn.DrawnType {
            if viewModel.canvasRole == .imaginative1 {
                return .imaginative
            } else {
                return .observative
            }
        }
        
        viewModel.userDraw = getImageData()
        let newDrawn = Drawn(image: Image(uiImage: viewModel.userDraw),
                             type: typeOfJourney)
        
        currentPlant.drawns.append(newDrawn)
        
        RepositoryManager.shared.update(for: currentPlant)
        
        
        
        
        
        // código antigo
        
        // quebrar esse metodo em partes
        // chamar um método que aplica a lógica abaixo
        let receivedJourney = RepositoryManager.shared.currentJourney
        
        //        var typeOfJourney: Drawn.DrawnType {
        //            if viewModel.canvasRole == .imaginative1 {
        //                return .imaginative
        //            } else {
        //                return .observative
        //            }
        //        }
        
        
        //        viewModel.userDraw = getImageData()
        //        let newDrawn: Drawn = Drawn(image: Image(uiImage: viewModel.userDraw),
        //                                    type: typeOfJourney)
        //        receivedJourney.userDrawns.append(newDrawn)
        
        //        RepositoryManager.shared.currentJourney = receivedJourney
        
        // então realiza a ação de notificar o navManager para próxima tela
        switch viewModel.canvasRole {
        case .imaginative1:
            NavigationManager.shared.path.append(ImaginativeRoutes.miniInfo)
            
        case .imaginative2:
            NavigationManager.shared.path.append(ImaginativeRoutes.review)
            
        case .observative:
            NavigationManager.shared.path.append(ObservativeRoutes.conquer)
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    
    
    
}

struct Canvas_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView(viewModel: CanvasViewModel(canvasRole: .imaginative1)).previewInterfaceOrientation(.landscapeLeft)
    }
}
