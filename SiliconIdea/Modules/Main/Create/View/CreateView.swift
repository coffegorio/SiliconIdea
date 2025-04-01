//
//  CreateView.swift
//  SiliconIdea
//
//  Created by Егорио on 31.03.2025.
//

import SwiftUI

struct CreateView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel: CreateViewModel
    
    var body: some View {
        ZStack {
            Color(colorScheme == .dark ? DarkThemeColors.backgroundColor : LightThemeColors.backgroundColor)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Привет, \(viewModel.username)! 👋")
                    .font(Font(Fonts.boldTitle))
                    .foregroundStyle(Color(colorScheme == .dark ? LightThemeColors.backgroundColor : DarkThemeColors.backgroundColor))
                
                Text("Готовы создать что-то новое?")
                    .font(Font(Fonts.title))
                    .foregroundStyle(Color(UnityColors.primaryColor))
                
                Text("Ваши недавние проекты: ")
                    .font(Font(Fonts.subtitle))
                
                Spacer()
            }
            .padding(30)
        }
    }
}
