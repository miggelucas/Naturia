//
//  CardGalleryHomeViewModel.swift
//  Naturia
//
//  Created by lrsv on 07/04/23.
//  
//

import SwiftUI

// MARK: Variables to watch mark as Published. ViewModel also calls API/Core Data

final class CardGalleryHomeViewModel: ObservableObject {
    @Published var title: String = ""
    
    init() {
        title = "Galeria"
    }
    
    func onTap() {
        print("onTap CardGalleryHomeViewModel")
    }
}
