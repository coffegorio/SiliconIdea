//
//  ArrowBackscreen.swift
//  SiliconIdea
//
//  Created by Егорио on 30.03.2025.
//

import SwiftUI

struct ArrowBackscreen: View {
    
    var action: () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "arrow.backward")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .foregroundStyle(Color(UnityColors.primaryColor))
        }
        .padding(.leading, 16)
        .padding(.top, 8)
    }
}
