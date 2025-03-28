//
//  AuthCoordinator.swift
//  SiliconIdea
//
//  Created by Егорио on 28.03.2025.
//

import UIKit
import SwiftUI

class AuthCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [any Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showMainAuthScreen()
    }
    
    func showMainAuthScreen() {
        let mainAuthViewModel = MainAuthViewModel(coordinator: self)
        let mainAuthView = MainAuthView(viewModel: mainAuthViewModel)
        let hostingController = UIHostingController(rootView: mainAuthView)
        navigationController.pushViewController(hostingController, animated: true)
    }
    
    func navigateToSignUp() {
        showSignUpScreen()
    }
    
    func showSignUpScreen() {
        let signUpViewModel = SignUpViewModel(coordinator: self)
        let signUpView = SignUpView(viewModel: signUpViewModel)
        let hostingController = UIHostingController(rootView: signUpView)
        navigationController.pushViewController(hostingController, animated: true)
    }
}
