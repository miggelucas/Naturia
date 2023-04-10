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
            DrawingCanvas(canvasView: $viewModel.canvasView)
            
            HStack(alignment: .top, spacing: 0) {
                VStack(alignment: .leading, spacing: 24) {
                    Button {
                        
                    } label: {
                        Text("🔙 Voltar")
                            .underline()
                    }
                    .onTapGesture {
                        viewModel.backButtonPressed()
                    }
                    
                    ExpandableView(viewType: viewModel.toggleType, provocacoes: viewModel.provocacoes, referencia: viewModel.referencia)
                }
                .padding(.leading, 32)
                .fixedSize()
                
                Spacer()
                
                DoneButton(actionForDone: {
                    viewModel.doneButtonPressed()
                })
                .padding(.trailing, 32)
            }
            .padding(.top, 48.0)
        }
        .navigationDestination(for: CanvasRoutes.self, destination: { canvasRoutes in
            switch canvasRoutes {
            case .miniInfos:
                MiniInfosView()
            case .review:
                ReviewView()
            }
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            viewModel.navigationManager = navigationManager
        }
    }
    
    
    
    
}

struct Canvas_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView()
    }
}
