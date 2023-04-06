//
//  ContentView.swift
//  Naturia
//
//  Created by lrsv on 29/03/23.
//

import Foundation
import SwiftUI

struct ContentView: View {
    var body: some View {
//        NavigationStack {
//            appView
//        }
        GaleryView()
    }
    
    private var appView: some View {
        HomeView().navigationDestination(for: Routes.self) { route in
            switch route {
            case .home:
                HomeView()
            case .canvas:
                CanvasView()
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var preview: some View {
//        ContentView()
//    }
//}
