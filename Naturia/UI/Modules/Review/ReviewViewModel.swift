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
    
    func onTapFirstButton() {
        if let safeNavigationManager = navigationManager{
//            safeNavigationManager.path.append(Routes.aditionalInformation)
        }
    }
    
    func onTapSecondButton() {
        if let safeNavigationManager = navigationManager{
            safeNavigationManager.popToRoot()
        }
        print("aa")
    }
}
