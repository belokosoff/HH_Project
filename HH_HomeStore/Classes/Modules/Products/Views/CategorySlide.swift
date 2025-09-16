// Created by Maxim Belokosov.
//

import SwiftUI

struct CategorySlide: View {
    @Binding var selectedCategory: Category

    let categories: [Category]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(categories, id: \.self) { category in
                    CategoryButton(
                        title: category.displayName,
                        isSelected: selectedCategory == category
                    ) {
                        selectedCategory = category
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    CategorySlide(selectedCategory: .constant(.all), categories: Category.allCases)
        .padding()
}
