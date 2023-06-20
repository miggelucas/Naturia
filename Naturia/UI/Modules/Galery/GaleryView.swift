//
//  GaleryView.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 05/04/23.
//

import SwiftUI

struct GaleryView: View {
    
    @ObservedObject var viewModel: GaleryViewModel
    
    init(viewModel: GaleryViewModel = GaleryViewModel()) {
        self.viewModel = viewModel
    }
    
    
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
                                    ForEach(viewModel.journeysPlants, id: \.id) { plant in
                                        Button {
                                            viewModel.plantPressed(for: plant)
                                            
                                        } label: {
                                            CardObservative(plantIconDrawn: Image(plant.iconPath),
                                                            plantName: plant.popularName)
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
                                    
                                    ForEach(viewModel.drawns, id: \.hashValue) { drawn in
                                        Button {
                                            viewModel.drawnPressed(for: CardGaleryDrawn(drawn: drawn,
                                                                                        text: drawn.plantName))
                                        } label: {
                                            CardGaleryDrawn(drawn: drawn,
                                                            text: drawn.creationDate.formatted(date: .abbreviated, time: .omitted))
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
    }
    
    struct GaleryView_Previews: PreviewProvider {
        static var previews: some View {
            GaleryView(viewModel: GaleryViewModel(journeys:  ObservativeJourney.getObservativeJourneys(),  mode: .plants
                                                 )
            )
        }
    }
}
