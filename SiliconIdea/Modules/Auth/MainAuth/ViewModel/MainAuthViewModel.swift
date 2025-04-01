//
//  MainAuthViewModel.swift
//  SiliconIdea
//
//  Created by Егорио on 28.03.2025.
//

import Foundation

class MainAuthViewModel {
    private weak var coordinator: AuthCoordinator?
    
    init(coordinator: AuthCoordinator? = nil) {
        self.coordinator = coordinator
    }
    
    func showSignUp() {
        self.coordinator?.navigateToSignUp()
    }
    
    func showSignIn() {
        self.coordinator?.navigateToSignIn()
    }
}
