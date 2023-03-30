//
//  DrawingCanvas.swift
//  Naturia
//
//  Created by ditthales on 28/03/23.
//

import Foundation

import SwiftUI
import PencilKit

struct DrawingCanvas: UIViewRepresentable {
    
    @Binding var canvasView: PKCanvasView
    var toolPicker = PKToolPicker.init()
    
    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.delegate = context.coordinator
        canvasView.tool = PKInkingTool(.pen, color: .black, width: 10)
        canvasView.drawingPolicy = .default
        
       
        return canvasView
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        toolPicker.addObserver(canvasView)
        toolPicker.setVisible(true, forFirstResponder: canvasView)
        canvasView.becomeFirstResponder()
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, PKCanvasViewDelegate  {
        var parent: DrawingCanvas
        
        init(_ parent: DrawingCanvas) {
            self.parent = parent
        }
        
        func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
            // Do something when drawing changes
        }
    }
}
