//
//  ContentView.swift
//  Naturia
//
//  Created by lrsv on 29/03/23.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @StateObject var navigationManager: NavigationManager = NavigationManager()
    
    var body: some View {
        
        HomeView()
        // Usando a view atual como conteúdo da tela
//        navigationManager.currentView()
        

    }
    
    //    private var appView: some View {
    //        HomeView().navigationDestination(for: Routes.self) { route in
    //            switch route {
    //            case .home:
    //                HomeView()
    //            case .canvas:
    //                CanvasView()
    //            }
    //        }
    //    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
