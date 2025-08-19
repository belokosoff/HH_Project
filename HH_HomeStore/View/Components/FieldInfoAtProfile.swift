//
//  FieldInfoAtProfile.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 19.08.2025.
//

import SwiftUI

struct FieldInfoAtProfile: View {
    let title: String
    let info: String
    let image: String
    
    var body: some View {
        VStack{
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
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.custom("Lexend", size: 16))
                        .foregroundStyle(.black)
                    Text(info)
                        .font(.custom("Lexend", size: 14))
                        .foregroundStyle(.gray)
                }
            
                Spacer()
            }
        }
    }
}


#Preview {
    FieldInfoAtProfile(title: "Имя", info: "123", image: "car")
}

