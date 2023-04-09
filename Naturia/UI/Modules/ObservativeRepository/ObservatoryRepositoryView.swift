//
//  ObservatoryRepositoryView.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 03/04/23.
//

import SwiftUI

struct ObservatoryRepositoryView: View {
    
    let viewModel: ObservatoryRepositoryViewModel
    
    init(viewModel: ObservatoryRepositoryViewModel = ObservatoryRepositoryViewModel()) {
        self.viewModel = viewModel
    }
    
    
    let gridLayout = [GridItem(.flexible()),
                      GridItem(.flexible()),
                      GridItem(.flexible())]
    
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
                                    CardObservative(plantIconDrawn: jorney.plant.plantIcon,
                                                    plantName: jorney.name)
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
        .ignoresSafeArea()
    }
}



struct ObservatoryRepositoryView_Previews: PreviewProvider {
    static var previews: some View {
        // content state view
        ObservatoryRepositoryView(viewModel: ObservatoryRepositoryViewModel(journeyArray: [
            ObservativeJourney.placeholderObservativeJourney(name: "Samambaia"),
            ObservativeJourney.placeholderObservativeJourney(name: "Jiboia"),
            ObservativeJourney.placeholderObservativeJourney(name: "Pau Brasil"),
            ObservativeJourney.placeholderObservativeJourney(name: "Coqueiro"),
            ObservativeJourney.placeholderObservativeJourney(name: "Mangueira"),
            ObservativeJourney.placeholderObservativeJourney(name: "Cacto"),
            ObservativeJourney.placeholderObservativeJourney(name: "Pé de Jaca"),
            ObservativeJourney.placeholderObservativeJourney(name: "Espada de São Jorge"),
            ObservativeJourney.placeholderObservativeJourney(name: "Baobá"),
            ObservativeJourney.placeholderObservativeJourney(name: "Vitória Régia"),
            ObservativeJourney.placeholderObservativeJourney(name: "Jambeiro")]))
        
        // empty state view
//        ObservatoryRepositoryView()
        
        
        
    }
}
