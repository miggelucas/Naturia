//
//  CanvasViewModel.swift
//  Naturia
//
//  Created by ditthales on 28/03/23.
//  
//

import SwiftUI

// MARK: Variables to watch mark as Published. ViewModel also calls API/Core Data

final class CanvasViewModel: ObservableObject {
    @Published var example: String?
}