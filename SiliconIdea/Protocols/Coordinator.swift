//
//  Coordinator.swift
//  SiliconIdea
//
//  Created by Егорио on 28.03.2025.
//

import UIKit

protocol Coordinator: AnyObject {
    
    var navigationController: UINavigationController { get }
    var childCoordinators: [any Coordinator] { get set }
    
    func start()
    
}
