// Created by Maxim Belokosov.
//

import SwiftUI

struct ReviewCell: View {
    // MARK: Internal

    let review: Review

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Верхняя часть: аватар + имя + дата
            HStack(alignment: .top, spacing: 12) {
                avatarView
                    .frame(width: 40, height: 40)
                    .background(Color.gray.opacity(0.6))
                    .clipShape(Circle())

                VStack(alignment: .leading, spacing: 4) {
                    Text(review.author.name)
                        .font(.custom("Lexend", size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)

                    Text(formatDate(review.createdAt))
                        .font(.custom("Lexend", size: 14))
                        .foregroundColor(.gray)
                }
            }

            // Звёзды
            HStack(spacing: 2) {
                ForEach(1 ... 5, id: \.self) { star in
                    Image(systemName: star <= review.rating ? "star.fill" : "star")
                        .foregroundColor(star <= review.rating ? .black : .gray)
                        .font(.system(size: 18))
                }
            }

            // Текст отзыва
            Text(review.text)
                .font(.custom("Lexend", size: 16))
                .foregroundColor(.black)
                .lineLimit(2)
                .padding(.vertical, 4)

            // Лайки / дизлайки
            HStack(spacing: 20) {
                likeButton(label: "hand.thumbsup", count: review.likes)
                likeButton(label: "hand.thumbsdown", count: review.dislikes)
            }
            .padding(.top, 2)
        }
    }

    // MARK: Private

    // MARK: - Аватар

    @ViewBuilder private var avatarView: some View {
        if let url = review.author.avatarUrl {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image(systemName: "person.fill")
                    .resizable()
                    .foregroundColor(.gray)
            }
        } else {
            Image(systemName: "person.fill")
                .resizable()
                .foregroundColor(.gray)
        }
    }

    // MARK: - Кнопка лайка/дизлайка

    @ViewBuilder
    private func likeButton(label: String, count: Int) -> some View {
        HStack(spacing: 4) {
            Image(systemName: label)
                .foregroundColor(.gray)
            Text("\(count)")
                .font(.custom("Lexend", size: 14))
                .foregroundColor(.gray)
        }
    }

    // MARK: - Форматирование даты

    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}
