//
//  NavigationManager.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 08/04/23.
//

import Foundation
import SwiftUI

class NavigationManager: ObservableObject {
    static let shared = NavigationManager()
    @Published var stack: [any View] = []
    
    func push<Content: View>(_ view: Content) {
        stack.append(view)
    }
    
    func pop() {
        _ = stack.popLast()
    }
    
    func popToRoot() {
        stack.removeAll()
    }
    
    func currentView() -> AnyView {
        return stack.last as! AnyView
    }
}
