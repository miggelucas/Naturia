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
    @State private var currentView: AnyView = AnyView(
        GaleryView(viewModel:
                    GaleryViewModel(journeys:
                                        [    ObservativeJourney.genericPlaceholderObservativeJourney(isDone: false),
                                             ObservativeJourney.genericPlaceholderObservativeJourney(isDone: true),
                                             ImaginativeJourney.getPlaceholderImaginativeJourney(isJourneyDone: true),
                                             ImaginativeJourney.getPlaceholderImaginativeJourney(isJourneyDone: false),
                                             ObservativeJourney.genericPlaceholderObservativeJourney(isDone: false),
                                             ObservativeJourney.genericPlaceholderObservativeJourney(isDone: true),
                                             ImaginativeJourney.getPlaceholderImaginativeJourney(isJourneyDone: true),
                                             ImaginativeJourney.getPlaceholderImaginativeJourney(isJourneyDone: false),
                                             ObservativeJourney.genericPlaceholderObservativeJourney(isDone: false),
                                             ObservativeJourney.genericPlaceholderObservativeJourney(isDone: true),
                                             ImaginativeJourney.getPlaceholderImaginativeJourney(isJourneyDone: true),
                                             ImaginativeJourney.getPlaceholderImaginativeJourney(isJourneyDone: false),
                                             ObservativeJourney.genericPlaceholderObservativeJourney(isDone: false),
                                             ObservativeJourney.genericPlaceholderObservativeJourney(isDone: true),
                                             ImaginativeJourney.getPlaceholderImaginativeJourney(isJourneyDone: true),
                                             ImaginativeJourney.getPlaceholderImaginativeJourney(isJourneyDone: false)], mode: .plants)))
    
    
    var body: some View {
        //        HomeView()
        // Usando a view atual como conteúdo da tela
        currentView
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.automatic)
            .navigationViewStyle(StackNavigationViewStyle())
            .onReceive(navigationManager.$stack) { stack in
                guard let lastView = stack.last else { return }
                currentView = lastView
            }
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
