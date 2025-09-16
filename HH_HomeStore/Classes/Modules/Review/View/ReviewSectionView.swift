// Created by Maxim Belokosov.
//

import SwiftUI

struct ReviewSectionView: View {
    // MARK: Internal

    let reviews: [Review]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            if reviews.isEmpty {
                VStack(spacing: 16) {
                    Image(systemName: "star.slash.fill")
                        .font(.system(size: 48))
                        .foregroundColor(.gray.opacity(0.5))

                    Text("Отзывов пока нет")
                        .font(.custom("Lexend", size: 18))
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)

                    Text("Будьте первым, кто оставит отзыв!")
                        .font(.custom("Lexend", size: 14))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity, minHeight: 200)
                .background(.clear)
                .cornerRadius(12)
                .transition(.opacity)
                .animation(.easeInOut, value: reviews.isEmpty)
            } else {
                VStack(alignment: .leading, spacing: 4) {
                    let counts = calculateRatingCounts()
                    ForEach([5, 4, 3, 2, 1], id: \.self) { rating in
                        let count = counts[rating] ?? 0
                        let label = ratingLabel(for: rating, count: count)
                        Text("\(rating) звезд — \(count) \(label)")
                            .font(.custom("Lexend", size: 14))
                            .foregroundColor(.gray)
                    }
                }
                .padding(.bottom, 16)

                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(alignment: .leading, spacing: 20) {
                        ForEach(reviews) { review in
                            ReviewCell(review: review)
                        }
                    }
                }

                Button("Смотреть все отзывы") {}
                    .font(.custom("Lexend", size: 14))
                    .foregroundColor(.blue)
                    .underline()
                    .padding(.top, 8)
            }
        }.padding(.vertical, 8)
    }

    // MARK: Private

    private func calculateRatingCounts() -> [Int: Int] {
        var counts: [Int: Int] = [1: 0, 2: 0, 3: 0, 4: 0, 5: 0]
        for review in reviews {
            counts[review.rating, default: 0] += 1
        }
        return counts
    }

    private func ratingLabel(for _: Int, count: Int) -> String {
        if count == 0 {
            return "отзывов"
        }
        if count == 1 {
            return "отзыв"
        }
        if count < 5 {
            return "отзыва"
        }
        return "отзывов"
    }
}

#Preview {
    ReviewSectionView(reviews: [
        Review(
            id: "1",
            author: Author(
                name: "Анна Смирнова",
                avatarUrl: URL(string: "https://i.pravatar.cc/150?img=1")
            ),
            rating: 5,
            createdAt: Date().addingTimeInterval(-60 * 60 * 24 * 10),
            text: "Платье просто волшебное! Цветочный принт выглядит ещё ярче, чем на фото. Очень довольна покупкой.",
            likes: 8,
            dislikes: 0
        ),
        Review(
            id: "2",
            author: Author(
                name: "Дарья Кузнецова",
                avatarUrl: URL(string: "https://i.pravatar.cc/150?img=21")
            ),
            rating: 4,
            createdAt: Date().addingTimeInterval(-60 * 60 * 24 * 18),
            text: "Классное платье, сидит хорошо, но ткань немного тонковата. На солнце просвечивает.",
            likes: 5,
            dislikes: 1
        ),
        Review(
            id: "3",
            author: Author(
                name: "Елена Петрова",
                avatarUrl: nil
            ),
            rating: 5,
            createdAt: Date().addingTimeInterval(-60 * 60 * 24 * 30),
            text: "Отличный вариант на лето! Легко, удобно, стильно. Уже заказала второе — в другом цвете.",
            likes: 12,
            dislikes: 0
        ),
    ])
    .padding(.vertical)
}

#Preview("Без отзывов") {
    ReviewSectionView(reviews: [])
        .padding(.vertical)
}
