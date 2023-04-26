//
//  ConfirmacaoViewModel.swift
//  Naturia
//
//  Created by ditthales on 05/04/23.
//  
//

import SwiftUI

// MARK: Variables to watch mark as Published. ViewModel also calls API/Core Data

final class ConfirmacaoViewModel: ObservableObject {
    
    var navigationManager: NavigationManager?
    
    @Published var imagePath: String = "jiboiaReferencia"
    
    func viewDidApper() {
        let journey: Journey = RepositoryManager.shared.currentJourney
        
        let plantQuest: Plant = journey.plant
        
        imagePath = plantQuest.imagePath
    }
    
    func confirmativeButtonPressed() {
        if let safeNavManager = navigationManager {
            safeNavManager.pushToPath(ObservativeRoutes.canvas)
        }
    }
    
    func dismissButtonPressed() {
        if let safeNavManager = navigationManager {
            safeNavManager.backToPreviousView()
        }
    }
    
}
