//
//  SignUpViewModel.swift
//  SiliconIdea
//
//  Created by Егорио on 29.03.2025.
//

import Foundation

class SignUpViewModel {
    private weak var coordinator: AuthCoordinator?
    
    init(coordinator: AuthCoordinator? = nil) {
        self.coordinator = coordinator
    }
}
