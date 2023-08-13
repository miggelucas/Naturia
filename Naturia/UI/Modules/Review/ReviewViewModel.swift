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
    let navigationManager: NavigationManager = NavigationManager.shared
    let repositoryManager: RepositoryManager = RepositoryManager.shared
    
    var userImaginativeDrawn: Image {
        let plant = repositoryManager.currentJourney.plant
        
        var image = Image("star")
        
        for drawn in plant.userDrawns {
            if drawn.type == .imaginative {
                image =  drawn.image
            }
        }
        
        return image
        
    }
    
    var nameOfPlant: String {
        let plant = repositoryManager.currentJourney.plant
        return plant.popularName
    }
    
    
    var userObservativeDrawn: Image {
        let plant = repositoryManager.currentJourney.plant
        
        var image = Image("star")
        
        for drawn in plant.userDrawns {
            if drawn.type == .observative {
                image =  drawn.image
            }
        }
        
        return image
    }
    
    
    func viewDidApper()  {
        repositoryManager.userDidCompletedCurrentJourney()
        
    }
    
    func greenButtonPressed() {
            navigationManager.pushToPath(ImaginativeRoutes.plantsInfo)

    }
    
    func whiteButtonPressed() {
            navigationManager.popToRoot()

    }
}
