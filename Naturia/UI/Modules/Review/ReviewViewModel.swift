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
    var navigationManager: NavigationManager?
    
    var userImaginativeDrawn: Image {
        let journey = RepositoryManager.shared.currentJourney
        
        var image = Image("star")
        
        for drawn in journey.userDrawns {
            if drawn.type == .imaginative {
                image =  drawn.image
            }
        }
        
        return image
        
    }
    
    
    var userObservativeDrawn: Image {
        let journey = RepositoryManager.shared.currentJourney
        
        var image = Image("star")
        
        for drawn in journey.userDrawns {
            if drawn.type == .observative {
                image =  drawn.image
            }
        }
        
        return image
    }
    
    
    func viewDidApper()  {
        RepositoryManager.shared.userDidCompletedCurrentJourney()
        
    }
    
    func greenButtonPressed() {
        if let safeNavManager = navigationManager {
            safeNavManager.pushToPath(ImaginativeRoutes.plantsInfo)
        }else{
            print("n tem navmanagar")
        }
    }
    
    func whiteButtonPressed() {
        if let safeNavManager = navigationManager {
            safeNavManager.popToRoot()
        }
    }
}
