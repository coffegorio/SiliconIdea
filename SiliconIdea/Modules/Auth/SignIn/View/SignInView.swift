//
//  SignInView.swift
//  SiliconIdea
//
//  Created by Егорио on 30.03.2025.
//

import SwiftUI

struct SignInView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var viewModel: SignInViewModel
    
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
                
                Text("Войдите в свою учетную запись")
                    .font(Font(Fonts.title))
                    .foregroundStyle(Color(colorScheme == .dark ? LightThemeColors.backgroundColor : DarkThemeColors.backgroundColor))
                
                CustomTextFieldWrapper(placeholder: "Email", leftImage: UIImage(systemName: "envelope.fill"), text: $viewModel.email)
                    .frame(height: 50)
                
                CustomTextFieldWrapper(placeholder: "Пароль", leftImage: UIImage(systemName: "lock.fill"), text: $viewModel.password)
                    .frame(height: 50)
                
                CustomButtonWrapper(title: "Войти", isFill: true) {

                }
                .frame(height: 50)
                .disabled(true)
                
                CustomButtonWrapper(title: "Забыли пароль?", isFill: false) {
                    //
                }
                .frame(height: 50)
                
            }
            .padding(30)
            
        }
        
    }
}

