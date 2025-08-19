//
//  ButtonAtProfile.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 18.08.2025.
//

import SwiftUI

struct ButtonAtProfile<Destination: View>: View {
    let title: String
    let image: String
    let destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.1))
                        .frame(width: 40, height: 40)
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.black)
                }
                Text(title)
                    .font(.system(size: 16))
                    .foregroundStyle(.black)
                Spacer()
            }
        }
    }
}


#Preview {
    ButtonAtProfile(title: "Заказы", image: "help", destination: Text("Заказы"))
}

