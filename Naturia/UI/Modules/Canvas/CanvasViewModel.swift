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
    var navigationManager: NavigationManager?
    
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
    @Published var provocacoes: [String] = ["Provocacao 1 aaaaaaaaaaa", "Provocacao 2 aaaaaaaaaaa", "Provocacao 3 aaaaaaaaaaa"]
    @Published var referencia: String = "plantinha"
    
    init(canvasRole: CanvasRole) {
        self.canvasRole = canvasRole
    }
    

    func backButtonPressed(){
        if let safeNavManager = navigationManager {
            safeNavManager.path.removeLast()
        }
    }
    
    func viewDidAppear() {
        guard let safeNavManager = navigationManager else { return }
        
        guard let safeJourney = safeNavManager.currentJourney else { return }
        
        print("journada que entra no didAppear \(safeJourney)")
        provocacoes = safeJourney.drawingProvocations
        referencia = safeJourney.plant.imagePath
        print("chegou aqui")
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
