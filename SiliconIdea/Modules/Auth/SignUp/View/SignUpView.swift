//
//  SignUpView.swift
//  SiliconIdea
//
//  Created by Егорио on 29.03.2025.
//

import SwiftUI

struct SignUpView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var viewModel: SignUpViewModel
    
    var body: some View {
        ZStack {
            Color(colorScheme == .dark ? DarkThemeColors.backgroundColor : LightThemeColors.backgroundColor)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Переход работает")
            }
            .padding(30)
        }
    }
}
