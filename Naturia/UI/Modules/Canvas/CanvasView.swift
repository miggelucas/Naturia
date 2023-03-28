//
//  CanvasView.swift
//  Naturia
//
//  Created by ditthales on 28/03/23.
//  
//

import SwiftUI
import PencilKit

struct CanvasView: View {

    @ObservedObject private var viewModel = CanvasViewModel()
    @State private var canvasView = PKCanvasView()
    
    var body: some View {
        //Text(viewModel.example ?? "Hello World")
        ZStack(alignment: .topLeading) {
            Text("")
            ExpandableImageView()
            DrawingCanvas(canvasView: $canvasView)
        }
    }

}

struct Canvas_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView()
    }
}
