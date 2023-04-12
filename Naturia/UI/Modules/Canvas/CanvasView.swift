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
        
        
        //descobrir se recivedJouney é observative ou imaginve
        if receivedJourney != nil {
            typeOfJourney = .observative
        }else{
            typeOfJourney = .imaginative
        }

        
        viewModel.userDraw = getImageData()
        let newDrawn: Drawn = Drawn(image: Image(uiImage: viewModel.userDraw), type: typeOfJourney)
        receivedJourney?.userDrawns.append(newDrawn)
        
        navigationManager.currentJourney = receivedJourney
        print(viewModel.canvasRole)
        
        switch viewModel.canvasRole {
        case .imaginative1:
            navigationManager.path.append(CanvasRoutes.miniInfo)
                print("Caiu na miniInfo")
        case .imaginative2:
            navigationManager.path.append(CanvasRoutes.review)
            print("caiy aqyu")
        case .observative:
            navigationManager.path.append(CanvasRoutes.conquista)
        }

    }
    
    var body: some View {
        //Text(viewModel.example ?? "Hello World")
        ZStack(alignment: .topLeading){
            BackgroundView()
            
            DrawingCanvas(canvasView: $viewModel.canvasView)
            
            HStack(alignment: .top, spacing: 0) {
                VStack(alignment: .leading, spacing: 24) {
                    BackButton(style: .back) {
                        viewModel.backButtonPressed()
                    }
                    
                    ExpandableView(viewType: viewModel.toggleType, provocacoes: viewModel.provocacoes, referencia: viewModel.referencia)
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
        .navigationDestination(for: CanvasRoutes.self, destination: { canvaRoute in
            switch canvaRoute {
            case .conquista:
                ConquistaView()
            case .miniInfo:
                MiniInfosView()
            case .review:
                ReviewView()
            }
        })
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
