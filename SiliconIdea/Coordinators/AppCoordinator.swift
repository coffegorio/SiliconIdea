//
//  AppCoordinator.swift
//  SiliconIdea
//
//  Created by Егорио on 28.03.2025.
//

import UIKit
import SwiftUI

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [any Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.isNavigationBarHidden = true
    }
    
    func start() {
        showPreview()
    }
    
    func showPreview() {
        let previewViewModel = PreviewViewModel(coordinator: self)
        let previewView = PreviewView(viewModel: previewViewModel)
        navigationController.pushViewController(previewView, animated: true)
    }
    
    func finish() {
        removeCoordinator(self)
        navigateToAuth()
    }
    
    func navigateToAuth() {
        let authCoordinator = AuthCoordinator(navigationController: navigationController)
        childCoordinators.append(authCoordinator)
        authCoordinator.start()
    }
}
