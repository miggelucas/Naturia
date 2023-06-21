//
//  CanvasViewModel.swift
//  Naturia
//
//  Created by ditthales on 28/03/23.
//  
//

import SwiftUI
import PencilKit

// MARK: Variables to watch mark as Published. ViewModel also calls API/Core Data

final class CanvasViewModel: ObservableObject {
    
    let canvasRole: CanvasRole
    var navigationManager: NavigationManager = NavigationManager.shared
    
    @Published var example: String?
    var toggleType: ExpandableViewType {
        switch canvasRole {
        case .imaginative1:
            return .provocacao
        case .imaginative2:
            return .referencia
        case .observative:
            return .provocacao
        }
    }
    @Published var userDraw: UIImage = UIImage()
    @Published var canvasView = PKCanvasView()
    @Published var provocacoes: [String]
    @Published var referencia: String
    
    init(canvasRole: CanvasRole, journey: Journey = RepositoryManager.shared.currentJourney) {
        self.canvasRole = canvasRole
        self.provocacoes = journey.drawingProvocations
        self.referencia = journey.plant.imagePath
    }
    

    func backButtonPressed(){
        navigationManager.path.removeLast()
        
    }
    
    // tentar devolver essa lógica para viewModel
    
    func getImageData() -> UIImage{
        let drawingSize = UIScreen.main.bounds.size
        
        let drawingRect = CGRect(origin: .zero, size: drawingSize)
        let drawingImage = canvasView.drawing.image(from: drawingRect, scale: CGFloat(1.0))
        return drawingImage
    }
    
    func doneButtonPressed() {

        var currentPlant = RepositoryManager.shared.currentJourney.plant
        
        var typeOfJourney: Drawn.DrawnType {
            if canvasRole == .imaginative1 {
                return .imaginative
            } else {
                return .observative
            }
        }
        
        userDraw = getImageData()
        let newDrawn = Drawn(image: Image(uiImage: userDraw),
                             type: typeOfJourney)
        
        currentPlant.drawns.append(newDrawn)
        
        RepositoryManager.shared.update(for: currentPlant)
        
        
        // então realiza a ação de notificar o navManager para próxima tela
        switch canvasRole {
        case .imaginative1:
            NavigationManager.shared.path.append(ImaginativeRoutes.miniInfo)
            
        case .imaginative2:
            NavigationManager.shared.path.append(ImaginativeRoutes.review)
            
        case .observative:
            NavigationManager.shared.path.append(ObservativeRoutes.conquer)
        }
        
    }

    

    
//    func doneButtonPressed() {
//        guard let safeNavManage = navigationManager else { return }
//        let receivedJourney = safeNavManage.currentJourney
//        var typeOfJourney: Drawn.DrawnType
//        
//        
//        //descobrir se recivedJouney é observative ou imaginve
//        if receivedJourney is ImaginativeJourney {
//            typeOfJourney = .imaginative
//        } else {
//            typeOfJourney = .observative
//        }
//
//        
//        userDraw = getImageData()
//        let newDrawn: Drawn = Drawn(image: Image(uiImage: userDraw), type: typeOfJourney)
//        receivedJourney?.userDrawns.append(newDrawn)
//        
//        safeNavManage.currentJourney = receivedJourney
//        print(self.canvasRole)
//        
//        switch canvasRole {
//        case .imaginative1:
//            safeNavManage.path.append(CanvasRoutes.miniInfo)
//                print("Caiu na miniInfo")
//        case .imaginative2:
//            safeNavManage.path.append(CanvasRoutes.review)
//            print("caiy aqyu")
//        case .observative:
//            safeNavManage.path.append(CanvasRoutes.conquista)
//        }
//
//    }
//
//    func getImageData() -> UIImage{
//        let drawingImage = canvasView.drawing.image(from: canvasView.bounds, scale: CGFloat(1.0))
//        return drawingImage
//
//    }
}

enum ExpandableViewType{
    case provocacao, referencia
}
