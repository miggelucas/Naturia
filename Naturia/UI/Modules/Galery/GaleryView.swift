//
//  GaleryView.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 05/04/23.
//

import SwiftUI

struct GaleryView: View {
    
    
    let viewModel: GaleryViewModel
    
    init(viewModel: GaleryViewModel = GaleryViewModel(journeys: [])) {
        self.viewModel = viewModel
    }
    
    
    let gridLayout = [GridItem(.flexible()),
                      GridItem(.flexible()),
                      GridItem(.flexible())]
    
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack(spacing: 24) {
                
                HStack {
                    BackButton(actionForButton: {})
                    
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
                    switch viewModel.state {
                    case .content:
                        ScrollView {
                            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 32) {
                                ForEach(viewModel.completedJourneys, id: \.self) { jorney in
                                    Button {
                                        viewModel.itemPressed()
                                    } label: {
                                        CardObservative(plantIconDrawn: jorney.plant.plantIcon,
                                                        plantName: jorney.name)
                                    }
                                }
                            }
                        }
                        
                    case .empty:
                        Text("Você ainda não coletou nenhuma planta")
                        Spacer()
                    }
                    
                case .draws:
                    ScrollView {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 32) {
                            ForEach(viewModel.completedJourneys, id: \.self) { jorney in
                                
                                ForEach(jorney.userDrawns, id: \.self) { draw in
                                    Button {
                                        viewModel.itemPressed()
                                    } label: {
                                        CardGaleryDrawn(drawn: draw,
                                                        text: jorney.plant.popularName)
                                    }
                                    
                                }
                          
                            }
                        }
                    }
                }
                    
                  
                    
              
                
                
            }
            .padding(.horizontal, 32)
            .padding(.top, 48)
            
            
        }
        .ignoresSafeArea()
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
        ], mode: .draws
                                             )
        )
    }
}
