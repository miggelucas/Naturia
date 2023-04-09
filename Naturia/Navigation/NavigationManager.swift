//
//  NavigationManager.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 08/04/23.
//

import Foundation
import SwiftUI

class NavigationManager: ObservableObject {
    @Published var stack: [AnyView] = []
    
    func push<Content: View>(_ view: Content) {
        stack.append(AnyView(view))
    }
    
    func pop() {
        _ = stack.popLast()
    }
    
    func popToRoot() {
        stack.removeAll()
    }
    
    func getLastViewFromStack() -> AnyView {
        return stack.last!
    }
}
