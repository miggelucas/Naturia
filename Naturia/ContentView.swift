//
//  ContentView.swift
//  Naturia
//
//  Created by Lucas Migge de Barros on 23/03/23.
//

import SwiftUI
import PencilKit

struct ContentView: View {
    
    @State private var canvasView = PKCanvasView()
    
    var body: some View {

        DrawingCanvas(canvasView: $canvasView)
            
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
