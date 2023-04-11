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
    
    func greenButtonPressed() {
        if let safeNavManager = navigationManager {
            safeNavManager.pushToPath(ReviewView())
        }
    }
    
    func whiteButtonPressed() {
        if let safeNavManager = navigationManager {
            safeNavManager.popToRoot()
        }
    }
}
