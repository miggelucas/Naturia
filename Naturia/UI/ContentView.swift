//
//  ContentView.swift
//  Naturia
//
//  Created by lrsv on 29/03/23.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            HomeView()
                .navigationDestination(for: Routes.self) { route in
                    switch route {
                    case .canvas:
                        CanvasView()
                    case .galery:
                        GaleryView()
//                    case .miniInformation:
//                        MiniInfosView()
//                    case .review:
//                        ReviewView()
//                    case .aditionalInformation:
//                        MiniInfosView()
//                    case .canvasFinal:
//                        CanvasView()
                    }
                }
        }
        .environmentObject(navigationManager)
        .navigationViewStyle(.stack)
        .navigationBarTitleDisplayMode(.automatic)
        .navigationBarBackButtonHidden(true)
        
        
        
        
        //        HomeView()
        // Usando a view atual como conteúdo da tela
        //        currentView
        //            .navigationBarBackButtonHidden(true)
        //            .navigationBarTitleDisplayMode(.automatic)
        //            .navigationViewStyle(StackNavigationViewStyle())
        //            .onReceive(navigationManager.$stack) { stack in
        //                guard let lastView = stack.last else { return }
        //                currentView = lastView
        //            }
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
            .environmentObject(NavigationManager())
    }
}
