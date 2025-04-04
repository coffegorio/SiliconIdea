//
//  SignUpView.swift
//  SiliconIdea
//
//  Created by Егорио on 29.03.2025.
//

import SwiftUI

struct SignUpView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var viewModel: SignUpViewModel
    
    var body: some View {
        ZStack {
            Color(colorScheme == .dark ? DarkThemeColors.backgroundColor : LightThemeColors.backgroundColor)
                .ignoresSafeArea()
            
            FloatingCirclesBackground(count: 10)
            
            VStack(alignment: .leading, spacing: 20) {
                
                ArrowBackscreen {
                    viewModel.backToMainAuth()
                }
                
                Spacer()
                
                Text("Как Вас зовут? 👋")
                    .font(Font(Fonts.title))
                    .foregroundStyle(Color(colorScheme == .dark ? LightThemeColors.backgroundColor : DarkThemeColors.backgroundColor))
                
                CustomTextFieldWrapper(placeholder: "Ваше имя", leftImage: UIImage(systemName: "person.fill"), text: $viewModel.username)
                    .frame(height: 50)
                
                CustomButtonWrapper(title: "Продолжить", isFill: true) {
                    viewModel.nextToMain()
                }
                .frame(height: 50)
                .opacity(viewModel.isButtonEnabled ? 1.0 : 0.5)
                .disabled(!viewModel.isButtonEnabled)
                
            }
            .padding(30)
        }
    }
}
