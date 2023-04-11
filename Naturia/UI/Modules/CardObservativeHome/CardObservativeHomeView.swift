//
//  CardObservativeHomeView.swift
//  Naturia
//
//  Created by lrsv on 07/04/23.
//  
//

import SwiftUI

struct CardObservativeHomeView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @ObservedObject private var viewModel = CardObservativeHomeViewModel()
       
    var body: some View {
        CardObservativeHome(title: viewModel.title, description: viewModel.description, onTap: viewModel.onTap)
            .onAppear {
                viewModel.navigationManager = navigationManager
            }
    }

}

struct CardObservativeHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CardObservativeHomeView()
            .environmentObject(NavigationManager())
    }
}
