// Created by Maxim Belokosov.
//

// ReviewRowView.swift

import SwiftUI

struct ReviewRowView: View {
    let review: Review

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 12) {
                if let avatarUrl = review.author.avatarUrl {
                    AsyncImage(url: avatarUrl) { phase in
                        switch phase {
                        case .empty:
                            Circle()
                                .fill(Color.gray)
                                .frame(width: 40, height: 40)
                        case let .success(image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                        case .failure:
                            Circle()
                                .fill(Color.gray)
                                .frame(width: 40, height: 40)
                                .overlay(Image(systemName: "person").foregroundColor(.white))
                        @unknown default:
                            Circle()
                                .fill(Color.gray)
                                .frame(width: 40, height: 40)
                        }
                    }
                } else {
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 40, height: 40)
                        .overlay(
                            Text(String(review.author.name.first ?? "A"))
                                .foregroundColor(.white)
                                .font(.subheadline)
                        )
                }

                VStack(alignment: .leading, spacing: 2) {
                    Text(review.author.name)
                        .font(.custom("Lexend", size: 16))
                        .fontWeight(.medium)
                        .foregroundColor(.black)

                    HStack(spacing: 4) {
                        ForEach(1 ... 5, id: \.self) { star in
                            Image(systemName: star <= Int(review.rating) ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                                .font(.caption)
                        }
                        Text("(\(Int(review.rating)))")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }

                Spacer()

                Text(review.createdAt, style: .date)
                    .font(.custom("Lexend", size: 12))
                    .foregroundColor(.gray)
            }

            Text(review.text)
                .font(.custom("Lexend", size: 14))
                .foregroundColor(.black)
                .lineLimit(nil)

            HStack(spacing: 16) {
                HStack(spacing: 4) {
                    Image(systemName: "hand.thumbsup.fill")
                        .foregroundColor(.gray)
                    Text("\(review.likes)")
                        .font(.custom("Lexend", size: 12))
                        .foregroundColor(.gray)
                }

                HStack(spacing: 4) {
                    Image(systemName: "hand.thumbsdown.fill")
                        .foregroundColor(.gray)
                    Text("\(review.dislikes)")
                        .font(.custom("Lexend", size: 12))
                        .foregroundColor(.gray)
                }
            }
            .padding(.top, 4)
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    ReviewRowView(review: Review(
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
    ))
}
