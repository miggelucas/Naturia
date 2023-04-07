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
    
    init() {
        title = "Title"
        description = "Description"
    }
    
    func onTap() {
        print("onTap CardObservativeHomeViewModel")
    }
}
