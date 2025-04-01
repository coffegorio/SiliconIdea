//
//  MainCoordinator.swift
//  SiliconIdea
//
//  Created by Егорио on 31.03.2025.
//

import UIKit
import SwiftUI

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [any Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let tabbarController = setupTabbar()
        navigationController.setViewControllers([tabbarController], animated: true)
    }
    
    private func setupTabbar() -> UITabBarController {
        let tabbarController = UITabBarController()
        
        let createView = CreateView(viewModel: CreateViewModel(coordinator: self))
        let communityView = CommunityView(viewModel: CommunityViewModel(coordinator: self))
        let settingsView = SettingsView(viewModel: SettingsViewModel(coordinator: self))
        
        let createViewNav = createNavController(for: createView,
                                                title: "Создать",
                                                image: UIImage(systemName: "plus"),
                                                selectedImage: UIImage(systemName: "plus.fill"),
                                                hidesNavigationBar: true)
        
        
        let communityViewNav = createNavController(for: communityView,
                                                   title: "Сообщество",
                                                   image: UIImage(systemName: "person.3"),
                                                   selectedImage: UIImage(systemName: "person.3.fill"),
                                                   hidesNavigationBar: true)
        
        let settingsViewNav = createNavController(for: settingsView,
                                               title: "Настройки",
                                                  image: UIImage(systemName: "gearshape"),
                                                  selectedImage: UIImage(systemName: "gearshape.fill"),
                                                  hidesNavigationBar: true)
        
        tabbarController.viewControllers = [createViewNav, communityViewNav, settingsViewNav]
        tabbarController.tabBar.tintColor = UnityColors.primaryColor
        
        return tabbarController
    }
    
    private func createNavController<V: View>(
        for view: V,
        title: String,
        image: UIImage?,
        selectedImage: UIImage?,
        hidesNavigationBar: Bool = false
    ) -> UINavigationController {
        let hostingController = UIHostingController(rootView: view)
        hostingController.title = title
        hostingController.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
        
        let navController = UINavigationController(rootViewController: hostingController)
        navController.navigationBar.isHidden = hidesNavigationBar
        
        return navController
    }
    
}
