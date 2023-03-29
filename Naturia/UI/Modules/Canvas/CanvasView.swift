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
        ZStack(alignment: .topLeading){
            DrawingCanvas(canvasView: $canvasView)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    ExpandableView(viewType: viewModel.toggleType!)
                }
                .padding([.top, .leading], 20.0)
            
                Spacer()
                
                DoneButton()
                    .padding([.top, .trailing], 20.0)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

}

struct Canvas_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView()
    }
}
