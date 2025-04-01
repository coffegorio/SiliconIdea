//
//  CustomTextField.swift
//  SiliconIdea
//
//  Created by Егорио on 29.03.2025.
//

import UIKit

class CustomTextField: UITextField {

    var customPlaceholder: String = ""
    var leftsideImage: UIImage?
    private var imageView: UIImageView?
    
    init(customPlaceholder: String, leftsideImage: UIImage? = nil) {
        self.customPlaceholder = customPlaceholder
        self.leftsideImage = leftsideImage
        super.init(frame: .zero)
        
        configureTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTextField() {
        self.attributedPlaceholder = NSAttributedString(
            string: customPlaceholder,
            attributes: [
                .foregroundColor: traitCollection.userInterfaceStyle == .dark ? LightThemeColors.backgroundColor : DarkThemeColors.backgroundColor
            ]
        )
        
        self.textColor = traitCollection.userInterfaceStyle == .dark ? LightThemeColors.backgroundColor : DarkThemeColors.backgroundColor
        self.font = Fonts.body
        self.backgroundColor = .clear
        self.borderStyle = .none
        self.layer.borderWidth = 1
        self.layer.borderColor = UnityColors.primaryColor.cgColor
        self.layer.cornerRadius = 20
        
        self.returnKeyType = .done
        self.autocorrectionType = .no
        
        if let image = leftsideImage {
            let imgView = UIImageView(image: image.withRenderingMode(.alwaysTemplate))
            imgView.tintColor = UnityColors.primaryColor
            imgView.contentMode = .scaleAspectFit
            imgView.frame = CGRect(x: 10, y: 0, width: 24, height: 24) // Отступ слева
            
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 24)) // Увеличен отступ
            paddingView.addSubview(imgView)
            imgView.center.y = paddingView.center.y
            imgView.frame.origin.x = 10 // Смещение иконки левее
            
            self.leftView = paddingView
            self.leftViewMode = .always
            self.imageView = imgView
        }
        
        self.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    @objc private func textDidChange() {
        self.attributedPlaceholder = NSAttributedString(
            string: customPlaceholder,
            attributes: [
                .foregroundColor: traitCollection.userInterfaceStyle == .dark ? LightThemeColors.backgroundColor : DarkThemeColors.backgroundColor
            ]
        )
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let padding = min(55, bounds.width / 3)
        return bounds.insetBy(dx: padding, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let padding = min(55, bounds.width / 3)
        return bounds.insetBy(dx: padding, dy: 0)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let padding = min(55, bounds.width / 3)
        return bounds.insetBy(dx: padding, dy: 0)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if let previousTraitCollection = previousTraitCollection,
           traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            self.textColor = traitCollection.userInterfaceStyle == .dark ? LightThemeColors.backgroundColor : DarkThemeColors.backgroundColor
            
            if !self.isEditing {
                self.attributedPlaceholder = NSAttributedString(
                    string: customPlaceholder,
                    attributes: [
                        .foregroundColor: traitCollection.userInterfaceStyle == .dark ? LightThemeColors.backgroundColor : DarkThemeColors.backgroundColor
                    ]
                )
            }
        }
    }
}
