//
//  CustomButtonWrapper.swift
//  SiliconIdea
//
//  Created by Егорио on 29.03.2025.
//

import SwiftUI

struct CustomButtonWrapper: UIViewRepresentable {
    var title: String
    var isFill: Bool
    var action: () -> Void

    func makeUIView(context: Context) -> CustomButton {
        let button = CustomButton(title: title, isFill: isFill)
        button.addTarget(context.coordinator, action: #selector(Coordinator.buttonTapped), for: .touchUpInside)
        return button
    }

    func updateUIView(_ uiView: CustomButton, context: Context) {
        uiView.setTitle(title, for: .normal)
        uiView.updateFillState(isFill)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(action: action)
    }

    class Coordinator: NSObject {
        var action: () -> Void

        init(action: @escaping () -> Void) {
            self.action = action
        }

        @objc func buttonTapped() {
            action()
        }
    }
}
