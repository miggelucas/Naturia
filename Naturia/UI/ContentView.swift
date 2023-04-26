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
                .navigationDestination(for: ObservativeRoutes.self, destination: { routes in
                    switch routes {
                    case .observativeRepository:
                        ObservatoryRepositoryView()
                        
                    case .canvas:
                        CanvasView(viewModel: CanvasViewModel(canvasRole: .observative))
                        
                    case .confirmation:
                        ConfirmacaoView()
                        
                    case .conquer:
                        ConquistaView()
                        
                    case .plants:
                        PlantInfoView(viewModel: PlantInfoViewModel(buttonStyle: .backToHome))
                        
                    }})
            
                .navigationDestination(for: Routes.self) { route in
                    switch route {
                    case .canvas:
                        CanvasView(viewModel: CanvasViewModel(canvasRole: .imaginative1))
                        
                    case .galery:
                        GaleryView()
        
                    case .plantsInfoFromJourney:
                        PlantInfoView(viewModel: PlantInfoViewModel(buttonStyle: .backToHome))
                        
                    case .plantsInfoFromGalery:
                        PlantInfoView(viewModel: PlantInfoViewModel(journey: navigationManager.currentJourney!, buttonStyle: .back))
             
                        
                    case .canvasImaginative2:
                        CanvasView(viewModel: CanvasViewModel(canvasRole: .imaginative2))
                       
                    case .miniInfo:
                        MiniInfosView()
                        
                    case .review:
                        ReviewView()
                        
//                    case .drawnImageView:
//                        DrawImageView()

                    }
                    
                }
                .navigationDestination(for: CardGaleryDrawn.self) { card in
                    // gambiarra
                    DrawImageView(drawn: card.drawn, name: card.text)
                }


        }
        .environmentObject(navigationManager)
        .navigationViewStyle(.stack)
        .navigationBarTitleDisplayMode(.automatic)
        .navigationBarBackButtonHidden(true)
        .preferredColorScheme(.light)

    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(NavigationManager())
    }
}
