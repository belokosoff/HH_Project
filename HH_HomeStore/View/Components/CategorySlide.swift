//
//  CategorySlide.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 19.08.2025.
//

import SwiftUI

struct CategorySlide: View {
    let category : [String] = ["Все", "Одежда", "Обувь", "Аксессуары"]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(category, id:\.self) { category in
                    CategoryButton(title:"\(category)", isSelected: true) {
                        print("1")
                    }
                }
            }
        }.padding(.vertical, 10)
        
    }
}



#Preview {
    CategorySlide()
}
