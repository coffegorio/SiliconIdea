//
//  ThemeColors + Ext.swift
//  SiliconIdea
//
//  Created by Егорио on 28.03.2025.
//

import UIKit

extension UIColor {
    static var backgroundColor: UIColor {
        return UIColor { traitCollection in
            return traitCollection.userInterfaceStyle == .dark ? DarkThemeColors.backgroundColor : LightThemeColors.backgroundColor
        }
    }

    static var contentColor: UIColor {
        return UIColor { traitCollection in
            return traitCollection.userInterfaceStyle == .dark ? DarkThemeColors.contentColor : LightThemeColors.contentColor
        }
    }
}
