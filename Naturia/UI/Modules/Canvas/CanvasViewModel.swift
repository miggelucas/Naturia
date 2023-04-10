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
    
    var canvasRole: CanvasRole
    var navigationManager: NavigationManager?
    
    @Published var example: String?
    @Published var toggleType: ExpandableViewType = .provocacao
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
    
    func doneButtonPressed() {
        guard let safeNavManage = navigationManager else { return }
        let receivedJourney = safeNavManage.currentJourney
        var typeOfJourney: Drawn.DrawnType
        
        
        //descobrir se recivedJouney é observative ou imaginve
        if receivedJourney is ObservativeJourney{
            typeOfJourney = .observative
        }else{
            typeOfJourney = .imaginative
        }

        
        userDraw = getImageData()
        let newDrawn: Drawn = Drawn(image: Image(uiImage: userDraw), type: typeOfJourney)
        receivedJourney?.userDrawns.append(newDrawn)
        
        safeNavManage.currentJourney = receivedJourney
        
        switch canvasRole {
        case .imaginative1:
            safeNavManage.path.append(CanvasRoutes.miniInfo)
        case .imaginative2:
            safeNavManage.path.append(CanvasRoutes.review)
        case .observative:
            safeNavManage.path.append(CanvasRoutes.conquista)
        }

    }

    func getImageData() -> UIImage{
        let drawingImage = canvasView.drawing.image(from: canvasView.bounds, scale: CGFloat(1.0))
        return drawingImage
    }
}

enum ExpandableViewType{
    case provocacao, referencia
}
