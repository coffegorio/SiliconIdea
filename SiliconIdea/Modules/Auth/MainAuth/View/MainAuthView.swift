//
//  MainAuthVieqw.swift
//  SiliconIdea
//
//  Created by Егорио on 28.03.2025.
//

import SwiftUI

struct MainAuthView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var viewModel: MainAuthViewModel
    
    var body: some View {
        
        ZStack {
            
            Color(colorScheme == .dark ? DarkThemeColors.backgroundColor : LightThemeColors.backgroundColor)
                .ignoresSafeArea()
            
            FloatingCirclesBackground(count: 10)
            
            VStack(alignment: .leading, spacing: 20) {
                
                Spacer()
                
                Text("Silicon")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(UnityColors.primaryColor))
                Text("Создавай, презентуй, вдохновляй - где бы ты ни был.")
                    .font(Font(Fonts.title))
                    .foregroundStyle(Color(colorScheme == .dark ? LightThemeColors.backgroundColor : DarkThemeColors.backgroundColor))
                
                CustomButtonWrapper(title: "Начать!", isFill: true) {
                    viewModel.showSignUp()
                }
                .frame(height: 50)
                
                CustomButtonWrapper(title: "Войти", isFill: false) {
                    viewModel.showSignIn()
                }
                .frame(height: 50)
            }
            .padding(30)
            
        }
        
    }
}
