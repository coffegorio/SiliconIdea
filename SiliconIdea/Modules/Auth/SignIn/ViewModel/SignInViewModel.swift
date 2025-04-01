//
//  SignInViewModel.swift
//  SiliconIdea
//
//  Created by Егорио on 30.03.2025.
//

import Foundation
import SwiftUI
import Combine

class SignInViewModel: ObservableObject {
    private weak var coordinator: AuthCoordinator?
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isButtonEnabled: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    
    init(coordinator: AuthCoordinator? = nil) {
        self.coordinator = coordinator
    }
    
    func backToMainAuth() {
        self.coordinator?.backScreen()
    }
    
    func signIn() {
        self.coordinator?.finish()
    }
}
