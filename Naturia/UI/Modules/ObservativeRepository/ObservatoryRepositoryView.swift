//
//  ObservatoryRepositoryView.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 03/04/23.
//

import SwiftUI

struct ObservatoryRepositoryView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @ObservedObject var viewModel: ObservatoryRepositoryViewModel
    
    
    init(viewModel: ObservatoryRepositoryViewModel = ObservatoryRepositoryViewModel()) {
        self.viewModel = viewModel
    }
    
    
//    let gridLayout = [GridItem(.flexible()),
//                      GridItem(.flexible()),
//                      GridItem(.flexible())]
    
    // layout responsivo!
    let gridLayout = [GridItem(.adaptive(minimum: 280))]
    
    var body: some View {
        
        ZStack {
            BackgroundView()
            
            VStack {
                HStack {
                    BackButton(actionForButton: viewModel.backButtonPressed)
                    
                    Spacer()
                    
                }
                .padding(.bottom, 4)
                
                VStack(spacing: 16) {
                    Text("Jornada Observativa")
                        .font(Font.NaturiaPrimary(.h1))
                    
                    Text("Escolha alguma das plantas abaixo e vá ao mundo para desenhá-la")
                        .font(Font.NaturiaSecundary(.Subtitle))
                }
                .padding(.top, -60)
                .padding(.bottom, 48)
                
                switch viewModel.state {
                case .content:
                    ScrollView {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 32) {
                            ForEach(viewModel.journeys, id: \.self) { jorney in
                                Button {
                                    viewModel.journeyPressed(jorney)
                                } label: {
                                    CardObservative(plantIconDrawn: Image(jorney.plant.iconPath),
                                                    plantName: jorney.plant.popularName)
                                }
                            }
                        }
                    }
                    
                case .empty:
                    Spacer()
                    
                    Text(viewModel.textForEmptyState)
                        .font(Font.NaturiaSecundary(.Subtitle))
                    
                    Spacer()
                    
                }
                
            }
            .padding(.horizontal, 32)
            .padding(.top, 48)
        }
        .onAppear {
            viewModel.navigationManager = navigationManager
        }
        .navigationDestination(for: Journey.self, destination: { journey in
            CanvasView(viewModel: CanvasViewModel(canvasRole: .observative))
        })
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}



struct ObservatoryRepositoryView_Previews: PreviewProvider {
    static var previews: some View {
        // content state view
        ObservatoryRepositoryView()
        
        // empty state view
//        ObservatoryRepositoryView()
        
        
        
    }
}
