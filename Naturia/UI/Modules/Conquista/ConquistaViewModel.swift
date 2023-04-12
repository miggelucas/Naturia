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
    
    
    func confirmativeButtonPressed() {
        if let safeNavManager = navigationManager {
            safeNavManager.pushToPath(Routes.plantsInfoFromJourney)
        }
    }
    
    func dismissButtonPressed() {
        if let safeNavManager = navigationManager {
            safeNavManager.popToRoot()
        }
    }
    
    
}
