//
//  CreateViewModel.swift
//  SiliconIdea
//
//  Created by Егорио on 31.03.2025.
//

import Foundation
import SwiftUI
import Combine

class CreateViewModel: ObservableObject {
    private weak var coordinator: MainCoordinator?
    
    @Published var username: String = ""
    
    init(coordinator: MainCoordinator? = nil) {
        self.coordinator = coordinator
        loadUsername()
    }
    
    private func loadUsername() {
        if let savedUsername = UserdefaultsManager.shared.getUsername() {
            self.username = savedUsername
        }
    }
}
