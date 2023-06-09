//
//  CardObservativeHomeViewModel.swift
//  Naturia
//
//  Created by lrsv on 07/04/23.
//  
//

import SwiftUI

// MARK: Variables to watch mark as Published. ViewModel also calls API/Core Data

final class CardObservativeHomeViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var description: String = ""
    
    var safeNavManager: NavigationManager = NavigationManager.shared
    
    init() {
        title = "Jornada Observativa"
        description = "Explore as plantas por análise presencial! "
    }
    
    func onTap() {
        safeNavManager.path.append(ObservativeRoutes.observativeRepository)
     
        
    }
}
