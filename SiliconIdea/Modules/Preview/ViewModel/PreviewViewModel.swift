//
//  PreviewViewModel.swift
//  SiliconIdea
//
//  Created by Егорио on 28.03.2025.
//

import Foundation

class PreviewViewModel {
    private weak var coordinator: AppCoordinator?
    
    init(coordinator: AppCoordinator? = nil) {
        self.coordinator = coordinator
    }
    
    func navigateNextScreen() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.coordinator?.finish()
        }
    }
}
