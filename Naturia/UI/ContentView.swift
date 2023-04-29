//
//  ContentView.swift
//  Naturia
//
//  Created by lrsv on 29/03/23.
//

import Foundation
import SwiftUI

struct ContentView: View {
    
    @State var navigationManager = NavigationManager.shared
    
    var body: some View {
        NavigationStack(path: NavigationManager.shared.path) {
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
                        
                    }}
                )
                .navigationDestination(for: GaleryRoutes.self, destination: { routes in
                    switch routes{
                    case .galery:
                        GaleryView()
                        
                    case .plantInfo:
                        PlantInfoView(viewModel: PlantInfoViewModel(buttonStyle: .back))
                        
                    case .drawn(let cardDrawn):
                        DrawImageView(drawn: cardDrawn.drawn, name: cardDrawn.text)
                    }
                })
                .navigationDestination(for: ImaginativeRoutes.self) { route in
                    switch route {
                    case .canvas:
                        CanvasView(viewModel: CanvasViewModel(canvasRole: .imaginative1))
            
        
                    case .plantsInfo:
                        PlantInfoView(viewModel: PlantInfoViewModel(buttonStyle: .backToHome))
            
                        
                    case .canvasImaginative2:
                        CanvasView(viewModel: CanvasViewModel(canvasRole: .imaginative2))
                       
                    case .miniInfo:
                        MiniInfosView()
                        
                    case .review:
                        ReviewView()
                        

                    }
                    
                }


        }
        .navigationViewStyle(.stack)
        .navigationBarTitleDisplayMode(.automatic)
        .navigationBarBackButtonHidden(true)
        .preferredColorScheme(.light)

    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
