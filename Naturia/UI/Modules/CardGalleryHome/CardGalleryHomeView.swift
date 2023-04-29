//
//  CardGalleryHomeView.swift
//  Naturia
//
//  Created by lrsv on 07/04/23.
//  
//

import SwiftUI

struct CardGalleryHomeView: View {

    @ObservedObject private var viewModel = CardGalleryHomeViewModel()
    var navigationManager = NavigationManager.shared
       
    var body: some View {
        CardGalleryHome(title: viewModel.title, onTap: viewModel.onTap)
            .onAppear {
                self.viewModel.navigationManager = self.navigationManager
            }
    }

}

struct CardGalleryHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CardGalleryHomeView()
    }
}
