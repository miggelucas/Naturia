//
//  ContentView.swift
//  Naturia
//
//  Created by lrsv on 29/03/23.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @ObservedObject private var navigationManager = NavigationManager.shared
    @Environment(\.presentationMode) private var presentationMode
    
    @ViewBuilder
    private var currentView: some View {
        Group {
            if let view = navigationManager.stack.last {
                switch view {
                case let galleryView as GaleryView:
                    galleryView
                default:
                    HomeView()
                }
                
            } else {
                HomeView()
            }
        }
        
    }
    
    var body: some View {
        NavigationView {
            currentView
                .navigationViewStyle(.stack)
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
