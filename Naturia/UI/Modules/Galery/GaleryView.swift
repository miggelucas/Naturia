//
//  GaleryView.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 05/04/23.
//

import SwiftUI

struct GaleryView: View {
    
    @ObservedObject var viewModel: GaleryViewModel
    @EnvironmentObject var navigationManager: NavigationManager
    
    init(viewModel: GaleryViewModel = GaleryViewModel()) {
        self.viewModel = viewModel
    }
    
    
    //    let gridLayout = [GridItem(.flexible()),
    //                      GridItem(.flexible()),
    //                      GridItem(.flexible())]
    
    let gridLayout = [GridItem(.adaptive(minimum: 280))]
    
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack(spacing: 24) {
                
                // backButton
                HStack {
                    BackButton(actionForButton: {
                        viewModel.backButtonPressed()
                    })
                    
                    Spacer()
                }
                
                // header
                VStack {
                    Text("Galeria de Plantas")
                        .font(Font.NaturiaPrimary(.h1))
                    
                    //                Text("Subtítulo")
                    //                    .font(Font.NaturiaSecundary(.Subtitle))
                    
                } .padding(.top, -80)
                
                Spacer()
                
                switch viewModel.mode {
                case .plants:
                    HStack(alignment: .center) {
                        
                        ArrowButton(buttonType: .right) {
                            // esse botao aqui é pura gambiarra
                            // so esta aqui para manter a proporcao da tela
                        }
                        .layoutPriority(2)
                        .opacity(0)
                        
                        switch viewModel.state {
                        case .content:
                            ScrollView {
                                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 32) {
                                    ForEach(viewModel.completedJourneys, id: \.self) { jorney in
                                        Button {
                                            viewModel.jorneyPressed(for: jorney)
                                            //                                                navigationManager.push(AnyView(PlantInfoView(viewModel: PlantInfoViewModel(journey: jorney))))
                                            
                                        } label: {
                                            CardObservative(plantIconDrawn: jorney.plant.plantIcon,
                                                            plantName: jorney.name)
                                        }
                                    }
                                }
                            }
                            
                        case .empty:
                            Spacer()
                            VStack {
                                Spacer()
                                Text("Você ainda não coletou nenhuma planta")
                                    .font(Font.NaturiaSecundary(.body))
                                Spacer()
                            }
                            Spacer()
                        }
                        
                        
                        ArrowButton(buttonType: .right) {
                            viewModel.rightArrowPressed()
                        }
                        .layoutPriority(2)
                        
                    }
                    
                    
                case .draws:
                    HStack(alignment: .center) {
                        ArrowButton(buttonType: .left) {
                            viewModel.leftArrowPressed()
                            
                        }
                        .layoutPriority(2)
                        
                        switch viewModel.state {
                        case .content:
                            ScrollView {
                                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 32) {
                                    ForEach(viewModel.completedJourneys, id: \.self) { jorney in
                                        
                                        ForEach(jorney.userDrawns, id: \.self) { draw in
                                            Button {
                                                viewModel.drawnPressed(for: CardGaleryDrawn(drawn: draw,
                                                                                            text: jorney.name))
                                            } label: {
                                                CardGaleryDrawn(drawn: draw,
                                                                text: jorney.name)
                                            }
                                        }
                                        
                                    }
                                }
                            }
                            
                        case .empty:
                            Spacer()
                            VStack {
                                Spacer()
                                Text("Você ainda não concluiu nenhuma jornada")
                                    .font(Font.NaturiaSecundary(.body))
                                Spacer()
                            }
                            Spacer()
                            
                        }
                        
                        
                        
                        ArrowButton(buttonType: .left) {
                            // assim como o botao no caso da tela de plantas
                            // esse cara eh gambiarra, esta aqui para manter proporcao da tela
                        }
                        .layoutPriority(2)
                        .opacity(0)
                    }
                    
                    
                    
                    
                }
                
                
            }
            .padding(.horizontal, 32)
            .padding(.top, 48)
            .ignoresSafeArea()
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(for: Journey.self) { journey in
            PlantInfoView(viewModel: PlantInfoViewModel(journey: journey), backButtonStyle: .back)
        }
        .navigationDestination(for: CardGaleryDrawn.self) { card in
            DrawImageView(drawn: card.drawn, name: card.text)
        }
        
        .onAppear {
            self.viewModel.navigationManager = self.navigationManager
            
        }
    }
    
    struct GaleryView_Previews: PreviewProvider {
        static var previews: some View {
            GaleryView(viewModel: GaleryViewModel(journeys:  [
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
                ImaginativeJourney.getPlaceholderImaginativeJourney(isJourneyDone: false),
                ObservativeJourney.genericPlaceholderObservativeJourney(isDone: false),
                ObservativeJourney.genericPlaceholderObservativeJourney(isDone: true),
                ImaginativeJourney.getPlaceholderImaginativeJourney(isJourneyDone: true),
                ImaginativeJourney.getPlaceholderImaginativeJourney(isJourneyDone: false)
            ],  mode: .plants
                                                 )
            )
            .environmentObject(NavigationManager())
        }
    }
}
