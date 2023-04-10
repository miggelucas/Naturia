//
//  CanvasView.swift
//  Naturia
//
//  Created by ditthales on 28/03/23.
//  
//

import SwiftUI

struct CanvasView: View {
    @ObservedObject private var viewModel = CanvasViewModel()
    @EnvironmentObject var navigationManager: NavigationManager
    
    
    var body: some View {
        //Text(viewModel.example ?? "Hello World")
        ZStack(alignment: .topLeading){
            BackgroundView()
            
            DrawingCanvas(canvasView: $viewModel.canvasView)
            
            HStack(alignment: .top, spacing: 0) {
                VStack(alignment: .leading, spacing: 24) {
                    BackButton(style: .back) {
                        viewModel.backButtonPressed()
                    }
                    
                    ExpandableView(viewType: viewModel.toggleType, provocacoes: viewModel.provocacoes, referencia: viewModel.referencia)
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
        .onAppear {
            viewModel.navigationManager = navigationManager
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    
    
    
}

struct Canvas_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView().previewInterfaceOrientation(.landscapeLeft).environmentObject(NavigationManager())
    }
}
