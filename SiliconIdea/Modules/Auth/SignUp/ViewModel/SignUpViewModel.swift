//
//  SignUpViewModel.swift
//  SiliconIdea
//
//  Created by Егорио on 29.03.2025.
//

import Foundation
import SwiftUI
import Combine

class SignUpViewModel: ObservableObject {
    private weak var coordinator: AuthCoordinator?
    
    @Published var username: String = ""
    @Published var isButtonEnabled: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init(coordinator: AuthCoordinator? = nil) {
        self.coordinator = coordinator
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        $username
            .map { !$0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
            .assign(to: \.isButtonEnabled, on: self)
            .store(in: &cancellables)
    }
    
    func backToMainAuth() {
        self.coordinator?.backScreen()
    }
    
    func nextToMain() {
        if isButtonEnabled {
            // Сохраняем имя пользователя в UserDefaults
            UserdefaultsManager.shared.saveUsername(username)
            // Устанавливаем флаг, что пользователь вошел в систему
            UserdefaultsManager.shared.setLoggedIn(true)
            // Переходим на главный экран
            self.coordinator?.finish()
        }
    }
}
