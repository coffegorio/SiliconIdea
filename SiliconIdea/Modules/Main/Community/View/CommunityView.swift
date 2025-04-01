//
//  CommunityView.swift
//  SiliconIdea
//
//  Created by Егорио on 31.03.2025.
//

import SwiftUI

struct CommunityView: View {
    
    @Environment(\.colorScheme) var colorScheme
    var viewModel: CommunityViewModel
    
    var body: some View {
        ZStack {
            Color(colorScheme == .dark ? DarkThemeColors.backgroundColor : LightThemeColors.backgroundColor)
                .ignoresSafeArea()
            
            VStack {
                Text("Сообщество")
                    .font(Font(Fonts.boldTitle))
                    .foregroundStyle(Color(colorScheme == .dark ? LightThemeColors.backgroundColor : DarkThemeColors.backgroundColor))
                    .padding(.top, 20)
                
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(1...5, id: \.self) { index in
                            communityCard(name: "Пользователь \(index)", content: "Пример проекта #\(index)")
                        }
                    }
                    .padding()
                }
            }
        }
    }
    
    @ViewBuilder
    private func communityCard(name: String, content: String) -> some View {
        VStack(alignment: .leading) {
            HStack(spacing: 10) {
                Circle()
                    .fill(Color(UnityColors.secondaryColor))
                    .frame(width: 40, height: 40)
                
                VStack(alignment: .leading) {
                    Text(name)
                        .font(Font(Fonts.subtitle))
                        .foregroundStyle(Color(colorScheme == .dark ? LightThemeColors.backgroundColor : DarkThemeColors.backgroundColor))
                    
                    Text("2 часа назад")
                        .font(Font(Fonts.body))
                        .foregroundStyle(Color.gray)
                }
                
                Spacer()
            }
            
            Text(content)
                .padding(.vertical)
                .foregroundStyle(Color(colorScheme == .dark ? LightThemeColors.backgroundColor : DarkThemeColors.backgroundColor))
            
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(UnityColors.accentColor).opacity(0.2))
                .frame(height: 120)
                .overlay(
                    Text("Предпросмотр проекта")
                        .foregroundStyle(Color(UnityColors.accentColor))
                )
                
            HStack {
                Image(systemName: "heart")
                    .foregroundStyle(Color(UnityColors.primaryColor))
                Text("12")
                    .foregroundStyle(Color(colorScheme == .dark ? LightThemeColors.backgroundColor : DarkThemeColors.backgroundColor))
                
                Spacer()
                
                Image(systemName: "message")
                    .foregroundStyle(Color(UnityColors.primaryColor))
                Text("5")
                    .foregroundStyle(Color(colorScheme == .dark ? LightThemeColors.backgroundColor : DarkThemeColors.backgroundColor))
            }
            .padding(.top, 8)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(UnityColors.primaryColor), lineWidth: 1)
        )
    }
}
