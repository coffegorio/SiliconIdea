//
//  CustomButton.swift
//  SiliconIdea
//
//  Created by Егорио on 29.03.2025.
//

import UIKit

class CustomButton: UIButton {
    
    var title: String
    var isFill: Bool
    
    init(title: String, isFill: Bool) {
        self.title = title
        self.isFill = isFill
        super.init(frame: .zero)
        setupUI()
        setupActions()
    }
    
    func setupUI() {
        self.setTitle(title, for: .normal)
        self.setTitleColor(isFill ? LightThemeColors.backgroundColor : UnityColors.primaryColor, for: .normal)
        self.backgroundColor = isFill ? UnityColors.primaryColor : .clear
        self.layer.borderWidth = isFill ? 0 : 1
        self.layer.borderColor = isFill ? nil : UnityColors.primaryColor.cgColor
        self.layer.cornerRadius = 20
    }
    
    func updateFillState(_ isFill: Bool) {
        self.isFill = isFill
        self.setTitleColor(isFill ? LightThemeColors.backgroundColor : UnityColors.primaryColor, for: .normal)
        self.backgroundColor = isFill ? UnityColors.primaryColor : .clear
        self.layer.borderWidth = isFill ? 0 : 1
        self.layer.borderColor = isFill ? nil : UnityColors.primaryColor.cgColor
    }
    
    func setupActions() {
        addTarget(self, action: #selector(buttonPressed), for: .touchDown)
        addTarget(self, action: #selector(buttonReleased), for: [.touchUpInside, .touchUpOutside])
    }
    
    @objc private func buttonPressed() {
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.1,
                       options: [.allowUserInteraction],
                       animations: {
            self.transform = CGAffineTransform(scaleX: 0.97, y: 0.97)
            self.alpha = 0.9
        })
    }
    
    @objc private func buttonReleased() {
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0.1,
                       options: [.allowUserInteraction],
                       animations: {
            self.transform = .identity
            self.alpha = 1.0
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
