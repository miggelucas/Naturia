//
//  NaturiaApp.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 23/03/23.
//

import SwiftUI

@main
struct NaturiaApp: App {
    @StateObject var navigationManager = NavigationManager()
    
    var body: some Scene {
        WindowGroup {
            ReviewView()
                .environmentObject(navigationManager)
        }
    }
}
