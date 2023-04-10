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
    @Published var example: String?
    @Published var toggleType: ExpandableViewType = .provocacao
    @Published var myImage: UIImage = UIImage()
    @Published var canvasView = PKCanvasView()
    @Published var provocacoes: [String] = ["Provocacao 1 aaaaaaaaaaa", "Provocacao 2 aaaaaaaaaaa", "Provocacao 3 aaaaaaaaaaa"]
    @Published var referencia: String = "plantinha"
    var navigationManager: NavigationManager?
    
    func doneButtonPressed() {
        if let safeNavigationManager = navigationManager{
//            safeNavigationManager.path.append(Routes.miniInformation)
        }
    }
    
    func backButtonPressed() {
        if let safeNavigationManager = navigationManager{
            safeNavigationManager.path.removeLast()
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
