//
//  NavigationManager.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 08/04/23.
//

import Foundation
import SwiftUI

class NavigationManager: ObservableObject {
    @Published var path = NavigationPath()
    
    static var shared = NavigationManager()

    
    func popToRoot() {
        self.path = NavigationPath()
    }
    
    func backToPreviousView() {
        self.path.removeLast()
    }
    
    func pushToPath(_ value: any Hashable) {
        self.path.append(value)
    }
    
}
