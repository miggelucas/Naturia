//
//  ConquistaViewModel.swift
//  Naturia
//
//  Created by ditthales on 05/04/23.
//  
//

import SwiftUI

// MARK: Variables to watch mark as Published. ViewModel also calls API/Core Data

final class ConquistaViewModel: ObservableObject {
    
    let safeNavManager = NavigationManager.shared
    
    @Published var userDrawImage: Image = Image("DesenhoCriativo")
    
    func updateUserDrawImage() {
        let journey = RepositoryManager.shared.currentJourney
        
        let drawns = journey.userDrawns
        
        for drawn in drawns {
            if drawn.type == .observative{
                userDrawImage =  drawn.image
                
            }
        }
    }
    
    func confirmativeButtonPressed() {
            safeNavManager.pushToPath(ObservativeRoutes.plants)
    }
    
    func dismissButtonPressed() {
            safeNavManager.popToRoot()
    }
    
    
}
