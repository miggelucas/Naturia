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
        guard let safeNaveManager = navigationManager else { return }
        
        guard let safeJourney = safeNaveManager.currentJourney else { return }
                
        self.imagePath = safeJourney.plant.imagePath
    }
    
    func confirmativeButtonPressed() {
        if let safeNavManager = navigationManager {
            safeNavManager.pushToPath(Routes.canvasObservative)
        }
    }
    
    func dismissButtonPressed() {
        if let safeNavManager = navigationManager {
            safeNavManager.backToPreviousView()
        }
    }
    
}
