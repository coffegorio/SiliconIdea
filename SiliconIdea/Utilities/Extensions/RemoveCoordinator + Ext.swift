//
//  RemoveCoordinator + Ext.swift
//  SiliconIdea
//
//  Created by Егорио on 31.03.2025.
//

import UIKit

extension Coordinator {
    func removeCoordinator(_ coordinator: Coordinator) {
        childCoordinators.removeAll { $0 === coordinator }
    }
}
