//
//  MiniInfosViewModel.swift
//  Naturia
//
//  Created by lrsv on 10/04/23.
//

import Foundation

final class MiniInfosViewModel: ObservableObject {
    var navigationManager: NavigationManager?
    
    func onTapFirstButton() {
        if let safeNavigationManager = navigationManager {
            safeNavigationManager.path.append(Routes.canvas)
        }
    }
    
    func onTapBackButton() {
        if let safeNavigationManager = navigationManager {
            safeNavigationManager.popToRoot()
        }
    }
}
