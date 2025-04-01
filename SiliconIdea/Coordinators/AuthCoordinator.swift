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
    
    func navigateToSignIn() {
        showSignInScreen()
    }
    
    func showSignInScreen() {
        let signInViewModel = SignInViewModel(coordinator: self)
        let signInView = SignInView(viewModel: signInViewModel)
        let hostingController = UIHostingController(rootView: signInView)
        navigationController.pushViewController(hostingController, animated: true)
    }
    
    func backScreen() {
        navigationController.popViewController(animated: true)
    }
    
    func finish() {
        removeCoordinator(self)
        navigateToMain()
    }
    
    func navigateToMain() {
        let mainCoordinator = MainCoordinator(navigationController: navigationController)
        childCoordinators.append(mainCoordinator)
        mainCoordinator.start()
    }
    
}
