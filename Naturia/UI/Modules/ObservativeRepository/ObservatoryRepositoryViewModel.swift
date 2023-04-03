//
//  ObservatoryRepositoryViewModel.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 03/04/23.
//

import Foundation
import SwiftUI

class ObservatoryRepositoryViewModel: ObservableObject {
    
    let elements = [
        CardObservative(plantIconDrawn: Image("Red Plant"), plantName: "Planta Verde"),
        
        CardObservative(plantIconDrawn: Image("Red Plant"), plantName: "Planta Vermelha44"),
        
        CardObservative(plantIconDrawn: Image("Violet Plant"), plantName: "Planta Vermelha213"),
        
        CardObservative(plantIconDrawn: Image("Green Plant"), plantName: "Planta Vermelha1"),
        
        CardObservative(plantIconDrawn: Image("Red Plant"), plantName: "Planta Vermelha2"),
        
        CardObservative(plantIconDrawn: Image("Red Plant"), plantName: "Planta Vermelha3"),
        CardObservative(plantIconDrawn: Image("Red Plant"), plantName: "Planta Vermelha4"),
        
        CardObservative(plantIconDrawn: Image("Red Plant"), plantName: "Planta Vermelha5"),
        
        CardObservative(plantIconDrawn: Image("Red Plant"), plantName: "Planta Vermelha6"),
        CardObservative(plantIconDrawn: Image("Red Plant"), plantName: "Planta Vermelha7"),
        
        CardObservative(plantIconDrawn: Image("Red Plant"), plantName: "Planta Vermelha8"),
        
        CardObservative(plantIconDrawn: Image("Red Plant"), plantName: "Planta Vermelha9")
    ]
    
    
    let jouneys: [ObservativeJouney] = [
        ObservativeJouney.getPlaceholderObservativeJourney(isJourneyDone: false)
    ]
    
    func backButtonPressed() {
        print("user pressed to go back to homeScreen")
    }
}
