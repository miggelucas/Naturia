//
//  HomeView.swift
//  Naturia
//
//  Created by lrsv on 29/03/23.
//  
//

import SwiftUI

struct HomeView: View {

    @ObservedObject private var viewModel = HomeViewModel()
       
    var body: some View {
        NavigationLink(value: Routes.canvas) {
            Text("Canvas")
        }
    }

}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
