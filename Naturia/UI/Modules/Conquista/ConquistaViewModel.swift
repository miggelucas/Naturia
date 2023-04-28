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
    var navigationManager: NavigationManager?
    
    @Published var userDrawImage: Image = Image("DesenhoCriativo")
    
    func viewDidAppear()  {
   
        let journey = RepositoryManager.shared.currentJourney
        
        let drawns = journey.userDrawns
        
        for drawn in drawns {
            if drawn.type == .observative{
                userDrawImage =  drawn.image
                
            }
        }
        Task {
            RepositoryManager.shared.userDidCompletedCurrentJourney()
        }
       
        
        
    }
    
    func confirmativeButtonPressed() {
        if let safeNavManager = navigationManager {
            safeNavManager.pushToPath(ObservativeRoutes.plants)
        }
    }
    
    func dismissButtonPressed() {
        if let safeNavManager = navigationManager {
            safeNavManager.popToRoot()
        }
    }
    
    
}
