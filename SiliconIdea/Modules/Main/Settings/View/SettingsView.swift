//
//  SettingsView.swift
//  SiliconIdea
//
//  Created by Егорио on 31.03.2025.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    var viewModel: SettingsViewModel
    
    var body: some View {
        ZStack {
            Color(colorScheme == .dark ? DarkThemeColors.backgroundColor : LightThemeColors.backgroundColor)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Настройки")
                    .font(Font(Fonts.boldTitle))
                    .foregroundStyle(Color(colorScheme == .dark ? LightThemeColors.backgroundColor : DarkThemeColors.backgroundColor))
                    .padding(.horizontal)
                    .padding(.top, 20)
                
                ScrollView {
                    VStack(spacing: 16) {
                        settingSection(title: "Профиль") {
                            settingRow(icon: "person.fill", title: "Личная информация")
                            settingRow(icon: "key.fill", title: "Изменить пароль")
                            settingRow(icon: "bell.fill", title: "Уведомления")
                        }
                        
                        settingSection(title: "Внешний вид") {
                            settingRow(icon: "paintbrush.fill", title: "Тема приложения")
                            settingRow(icon: "textformat.size", title: "Размер шрифта")
                        }
                        
                        settingSection(title: "Прочее") {
                            settingRow(icon: "questionmark.circle.fill", title: "Помощь и поддержка")
                            settingRow(icon: "info.circle.fill", title: "О приложении")
                            
                            Button(action: {
                                // Логика выхода из аккаунта
                                UserdefaultsManager.shared.clearAllUserData()
                            }) {
                                HStack {
                                    Image(systemName: "rectangle.portrait.and.arrow.right.fill")
                                        .foregroundStyle(Color(UnityColors.primaryColor))
                                    
                                    Text("Выйти из аккаунта")
                                        .foregroundStyle(Color(UnityColors.primaryColor))
                                    
                                    Spacer()
                                }
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color(UnityColors.primaryColor), lineWidth: 1)
                                )
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
    
    @ViewBuilder
    private func settingSection<Content: View>(title: String, @ViewBuilder content: @escaping () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(Font(Fonts.subtitle))
                .foregroundStyle(Color(UnityColors.primaryColor))
                .padding(.horizontal, 4)
                .padding(.top, 8)
            
            content()
        }
    }
    
    @ViewBuilder
    private func settingRow(icon: String, title: String) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundStyle(Color(UnityColors.secondaryColor))
            
            Text(title)
                .foregroundStyle(Color(colorScheme == .dark ? LightThemeColors.backgroundColor : DarkThemeColors.backgroundColor))
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(UnityColors.secondaryColor), lineWidth: 1)
                .opacity(0.5)
        )
    }
}
