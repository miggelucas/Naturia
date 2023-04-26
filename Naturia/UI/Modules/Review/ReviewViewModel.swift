//
//  ReviewViewModel.swift
//  Naturia
//
//  Created by ditthales on 30/03/23.
//  
//

import SwiftUI

// MARK: Variables to watch mark as Published. ViewModel also calls API/Core Data

final class ReviewViewModel: ObservableObject {
    @Published var example: String?
    var navigationManager: NavigationManager?
    
    @Published var userImaginativeDrawn: Image = Image("DesenhoCriativo")
    @Published var userObservativeDrawn: Image = Image("desenhoUsuario")
    
    
    func viewDidApper() {
        guard let safeNavManager = navigationManager else { return }
        guard let safeJourney = safeNavManager.currentJourney else { return }
        
        for drawn in safeJourney.userDrawns {
            switch drawn.type {
            case .imaginative:
                userImaginativeDrawn = drawn.image
                
            case .observative:
                userObservativeDrawn = drawn.image
            }
        }
        
    }
    
    func greenButtonPressed() {
        if let safeNavManager = navigationManager {
            safeNavManager.pushToPath(ImaginativeRoutes.plantsInfo)
        }
    }
    
    func whiteButtonPressed() {
        if let safeNavManager = navigationManager {
            safeNavManager.popToRoot()
        }
    }
}
