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
       
    var body: some View {
        CardGalleryHome(title: viewModel.title, onTap: viewModel.onTap)
        
    }

}

struct CardGalleryHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CardGalleryHomeView()
    }
}
