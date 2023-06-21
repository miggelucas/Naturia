//
//  CanvasView.swift
//  Naturia
//
//  Created by ditthales on 28/03/23.
//  
//

import SwiftUI


struct CanvasView: View {
    @ObservedObject private var viewModel: CanvasViewModel
    
    init(viewModel: CanvasViewModel) {
        self.viewModel = viewModel
    }
    
    
    var body: some View {
        ZStack(alignment: .topLeading){
            BackgroundView()
            
            DrawingCanvas(canvasView: $viewModel.canvasView)
            
            HStack(alignment: .top, spacing: 0) {
                VStack(alignment: .leading, spacing: 24) {
                    BackButton(style: .back) {
                        viewModel.backButtonPressed()
                    }
                    
                    ExpandableView(viewType: viewModel.toggleType,
                                   provocacoes: $viewModel.provocacoes,
                                   referencia: $viewModel.referencia)
                }
                .padding(.leading, 32)
                .fixedSize()
                
                Spacer()
                
                CTAButton(buttonType: .concluido, actionForButton: {
                    viewModel.doneButtonPressed()
                })
                .padding(.trailing, 32)
            }
            .padding(.top, 48.0)
        }
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    
    
    
}

struct Canvas_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView(viewModel: CanvasViewModel(canvasRole: .imaginative1)).previewInterfaceOrientation(.landscapeLeft)
    }
}
