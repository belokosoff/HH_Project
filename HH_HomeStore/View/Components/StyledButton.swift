//
//  StyledButton.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 17.08.2025.
//
import SwiftUI

struct StyledButton: View {
    let title : String
    var action: (() -> Void)?
    
    var body: some View {
        Button{
            action?()
        } label: {
            Text(title)
                .foregroundStyle(.white)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
        }
        .frame(height: 48)
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    StyledButton(title: "Войти") {
        
    }
}
